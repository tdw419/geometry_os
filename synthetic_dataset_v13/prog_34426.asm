; DESCRIPTION: Sets a single blue pixel at (400, 232).
; PLAN: r0=400(x), r1=232(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 232
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
