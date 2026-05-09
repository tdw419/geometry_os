; DESCRIPTION: Sets a single black pixel at (112, 3).
; PLAN: r0=112(x), r1=3(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 3
LDI r2, 0x000000
PSET r0, r1, r2
HALT
