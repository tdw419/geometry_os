; DESCRIPTION: Sets a single blue pixel at (287, 200).
; PLAN: r0=287(x), r1=200(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 200
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
