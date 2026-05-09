; DESCRIPTION: Sets a single black pixel at (316, 184).
; PLAN: r0=316(x), r1=184(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 316
LDI r1, 184
LDI r2, 0x000000
PSET r0, r1, r2
HALT
