; DESCRIPTION: Sets a single black pixel at (149, 183).
; PLAN: r0=149(x), r1=183(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 183
LDI r2, 0x000000
PSET r0, r1, r2
HALT
