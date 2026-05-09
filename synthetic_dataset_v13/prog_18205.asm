; DESCRIPTION: Sets a single red pixel at (121, 187).
; PLAN: r0=121(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 187
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
