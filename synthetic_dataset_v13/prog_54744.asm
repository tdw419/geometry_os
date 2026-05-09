; DESCRIPTION: Sets a single black pixel at (36, 145).
; PLAN: r0=36(x), r1=145(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 145
LDI r2, 0x000000
PSET r0, r1, r2
HALT
