; DESCRIPTION: Sets a single blue pixel at (153, 101).
; PLAN: r0=153(x), r1=101(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 101
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
