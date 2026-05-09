; DESCRIPTION: Sets a single blue pixel at (3, 65).
; PLAN: r0=3(x), r1=65(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 65
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
