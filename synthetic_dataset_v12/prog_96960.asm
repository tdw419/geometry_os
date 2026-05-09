; DESCRIPTION: Sets a single blue pixel at (32, 26).
; PLAN: r0=32(x), r1=26(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 26
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
