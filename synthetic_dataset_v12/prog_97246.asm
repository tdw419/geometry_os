; DESCRIPTION: Sets a single blue pixel at (457, 135).
; PLAN: r0=457(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 457
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
