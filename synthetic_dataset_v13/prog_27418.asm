; DESCRIPTION: Sets a single black pixel at (24, 179).
; PLAN: r0=24(x), r1=179(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 179
LDI r2, 0x000000
PSET r0, r1, r2
HALT
