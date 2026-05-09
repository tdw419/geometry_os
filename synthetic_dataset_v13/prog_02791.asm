; DESCRIPTION: Sets a single black pixel at (478, 133).
; PLAN: r0=478(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 478
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
HALT
