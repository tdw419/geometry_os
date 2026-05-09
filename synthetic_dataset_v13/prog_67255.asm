; DESCRIPTION: Sets a single blue pixel at (339, 94).
; PLAN: r0=339(x), r1=94(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 339
LDI r1, 94
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
