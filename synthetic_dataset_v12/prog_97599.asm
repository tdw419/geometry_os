; DESCRIPTION: Sets a single purple pixel at (170, 230).
; PLAN: r0=170(x), r1=230(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 230
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
