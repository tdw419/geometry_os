; DESCRIPTION: Sets a single blue pixel at (444, 225).
; PLAN: r0=444(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 444
LDI r1, 225
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
