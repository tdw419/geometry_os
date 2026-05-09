; DESCRIPTION: Sets a single purple pixel at (93, 96).
; PLAN: r0=93(x), r1=96(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 96
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
