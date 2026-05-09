; DESCRIPTION: Sets a single yellow pixel at (178, 49).
; PLAN: r0=178(x), r1=49(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 49
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
