; DESCRIPTION: Sets a single purple pixel at (52, 24).
; PLAN: r0=52(x), r1=24(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 24
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
