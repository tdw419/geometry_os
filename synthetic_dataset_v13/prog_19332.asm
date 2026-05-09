; DESCRIPTION: Sets a single black pixel at (269, 66).
; PLAN: r0=269(x), r1=66(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 269
LDI r1, 66
LDI r2, 0x000000
PSET r0, r1, r2
HALT
