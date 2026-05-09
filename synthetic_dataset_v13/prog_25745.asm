; DESCRIPTION: Sets a single yellow pixel at (163, 199).
; PLAN: r0=163(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 199
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
