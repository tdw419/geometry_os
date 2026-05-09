; DESCRIPTION: Sets a single black pixel at (177, 101).
; PLAN: r0=177(x), r1=101(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 101
LDI r2, 0x000000
PSET r0, r1, r2
HALT
