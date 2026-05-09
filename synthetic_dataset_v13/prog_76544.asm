; DESCRIPTION: Sets a single blue pixel at (236, 121).
; PLAN: r0=236(x), r1=121(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 121
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
