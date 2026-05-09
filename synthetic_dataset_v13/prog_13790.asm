; DESCRIPTION: Sets a single black pixel at (177, 1).
; PLAN: r0=177(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
HALT
