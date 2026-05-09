; DESCRIPTION: Sets a single purple pixel at (232, 24).
; PLAN: r0=232(x), r1=24(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 24
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
