; DESCRIPTION: Sets a single yellow pixel at (476, 39).
; PLAN: r0=476(x), r1=39(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 476
LDI r1, 39
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
