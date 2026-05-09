; DESCRIPTION: Sets a single blue pixel at (431, 243).
; PLAN: r0=431(x), r1=243(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 431
LDI r1, 243
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
