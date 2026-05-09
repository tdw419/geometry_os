; DESCRIPTION: Sets a single black pixel at (472, 165).
; PLAN: r0=472(x), r1=165(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 472
LDI r1, 165
LDI r2, 0x000000
PSET r0, r1, r2
HALT
