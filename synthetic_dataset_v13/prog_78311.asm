; DESCRIPTION: Sets a single blue pixel at (500, 208).
; PLAN: r0=500(x), r1=208(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 500
LDI r1, 208
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
