; DESCRIPTION: Sets a single black pixel at (355, 118).
; PLAN: r0=355(x), r1=118(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 355
LDI r1, 118
LDI r2, 0x000000
PSET r0, r1, r2
HALT
