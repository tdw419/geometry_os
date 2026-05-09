; DESCRIPTION: Sets a single purple pixel at (491, 17).
; PLAN: r0=491(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 491
LDI r1, 17
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
