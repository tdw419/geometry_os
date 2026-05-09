; DESCRIPTION: Sets a single blue pixel at (108, 251).
; PLAN: r0=108(x), r1=251(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 251
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
