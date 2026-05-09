; DESCRIPTION: Sets a single green pixel at (158, 118).
; PLAN: r0=158(x), r1=118(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 118
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
