; DESCRIPTION: Sets a single blue pixel at (297, 211).
; PLAN: r0=297(x), r1=211(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 297
LDI r1, 211
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
