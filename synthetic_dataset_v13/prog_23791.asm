; DESCRIPTION: Sets a single blue pixel at (163, 207).
; PLAN: r0=163(x), r1=207(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 207
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
