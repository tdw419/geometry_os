; DESCRIPTION: Sets a single blue pixel at (472, 123).
; PLAN: r0=472(x), r1=123(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 472
LDI r1, 123
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
