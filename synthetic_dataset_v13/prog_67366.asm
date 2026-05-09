; DESCRIPTION: Sets a single black pixel at (343, 211).
; PLAN: r0=343(x), r1=211(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 343
LDI r1, 211
LDI r2, 0x000000
PSET r0, r1, r2
HALT
