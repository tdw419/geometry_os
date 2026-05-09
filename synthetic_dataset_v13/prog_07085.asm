; DESCRIPTION: Sets a single yellow pixel at (163, 98).
; PLAN: r0=163(x), r1=98(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 98
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
