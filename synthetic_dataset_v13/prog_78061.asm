; DESCRIPTION: Sets a single black pixel at (179, 138).
; PLAN: r0=179(x), r1=138(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 138
LDI r2, 0x000000
PSET r0, r1, r2
HALT
