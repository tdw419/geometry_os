; DESCRIPTION: Sets a single green pixel at (303, 118).
; PLAN: r0=303(x), r1=118(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 303
LDI r1, 118
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
