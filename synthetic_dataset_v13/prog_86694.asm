; DESCRIPTION: Sets a single blue pixel at (437, 170).
; PLAN: r0=437(x), r1=170(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 437
LDI r1, 170
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
