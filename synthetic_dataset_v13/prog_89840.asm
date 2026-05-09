; DESCRIPTION: Sets a single purple pixel at (19, 227).
; PLAN: r0=19(x), r1=227(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 227
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
