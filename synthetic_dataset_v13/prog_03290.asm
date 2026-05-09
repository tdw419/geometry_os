; DESCRIPTION: Sets a single black pixel at (341, 129).
; PLAN: r0=341(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 341
LDI r1, 129
LDI r2, 0x000000
PSET r0, r1, r2
HALT
