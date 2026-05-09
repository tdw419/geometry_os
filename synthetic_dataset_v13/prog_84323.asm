; DESCRIPTION: Sets a single black pixel at (376, 15).
; PLAN: r0=376(x), r1=15(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 376
LDI r1, 15
LDI r2, 0x000000
PSET r0, r1, r2
HALT
