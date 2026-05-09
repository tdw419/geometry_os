; DESCRIPTION: Sets a single black pixel at (477, 181).
; PLAN: r0=477(x), r1=181(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 477
LDI r1, 181
LDI r2, 0x000000
PSET r0, r1, r2
HALT
