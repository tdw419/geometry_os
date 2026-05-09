; DESCRIPTION: Sets a single yellow pixel at (297, 156).
; PLAN: r0=297(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 297
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
