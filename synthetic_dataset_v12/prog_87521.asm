; DESCRIPTION: Sets a single blue pixel at (475, 78).
; PLAN: r0=475(x), r1=78(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 475
LDI r1, 78
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
