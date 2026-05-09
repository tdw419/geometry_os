; DESCRIPTION: Sets a single green pixel at (163, 118).
; PLAN: r0=163(x), r1=118(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 118
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
