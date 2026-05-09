; DESCRIPTION: Sets a single purple pixel at (85, 138).
; PLAN: r0=85(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 138
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
