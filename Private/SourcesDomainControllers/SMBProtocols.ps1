﻿$SMBProtocols = @{
    Enable = $true
    Source = @{
        Name       = 'SMB Protocols'
        Data       = {
            Get-ComputerSMB -ComputerName $DomainController
        }
        Area       = ''
        Parameters = @{

        }
    }
    Tests  = [ordered] @{
        EnableSMB1Protocol = @{
            Enable     = $true
            Name       = 'SMB v1 Protocol should be disabled'
            Parameters = @{
                Property      = 'EnableSMB1Protocol'
                ExpectedValue = $false
                OperationType = 'eq'
            }
        }
        EnableSMB2Protocol = @{
            Enable     = $true
            Name       = 'SMB v2 Protocol should be enabled'
            Parameters = @{
                Property      = 'EnableSMB2Protocol'
                ExpectedValue = $true
                OperationType = 'eq'
            }
        }
    }
}