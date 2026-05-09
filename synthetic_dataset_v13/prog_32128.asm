; DESCRIPTION: Sets a single blue pixel at (423, 0).
; PLAN: r0=423(x), r1=0(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 423
LDI r1, 0
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
