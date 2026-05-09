; DESCRIPTION: Sets a single black pixel at (361, 26).
; PLAN: r0=361(x), r1=26(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 361
LDI r1, 26
LDI r2, 0x000000
PSET r0, r1, r2
HALT
