; DESCRIPTION: Sets a single black pixel at (419, 130).
; PLAN: r0=419(x), r1=130(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 130
LDI r2, 0x000000
PSET r0, r1, r2
HALT
