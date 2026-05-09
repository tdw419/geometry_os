; DESCRIPTION: Sets a single blue pixel at (430, 121).
; PLAN: r0=430(x), r1=121(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 121
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
