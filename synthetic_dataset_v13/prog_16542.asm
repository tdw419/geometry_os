; DESCRIPTION: Sets a single black pixel at (83, 189).
; PLAN: r0=83(x), r1=189(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 189
LDI r2, 0x000000
PSET r0, r1, r2
HALT
