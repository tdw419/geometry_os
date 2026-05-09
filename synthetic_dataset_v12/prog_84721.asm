; DESCRIPTION: Sets a single purple pixel at (251, 121).
; PLAN: r0=251(x), r1=121(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 121
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
