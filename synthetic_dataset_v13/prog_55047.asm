; DESCRIPTION: Sets a single purple pixel at (466, 74).
; PLAN: r0=466(x), r1=74(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 466
LDI r1, 74
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
