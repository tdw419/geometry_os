; DESCRIPTION: Sets a single yellow pixel at (414, 135).
; PLAN: r0=414(x), r1=135(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 414
LDI r1, 135
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
