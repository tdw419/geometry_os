; DESCRIPTION: Sets a single black pixel at (34, 175).
; PLAN: r0=34(x), r1=175(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 175
LDI r2, 0x000000
PSET r0, r1, r2
HALT
