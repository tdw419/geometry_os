; DESCRIPTION: Sets a single purple pixel at (456, 109).
; PLAN: r0=456(x), r1=109(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 456
LDI r1, 109
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
