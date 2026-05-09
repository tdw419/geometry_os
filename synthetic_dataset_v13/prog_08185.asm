; DESCRIPTION: Sets a single white pixel at (40, 130).
; PLAN: r0=40(x), r1=130(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 130
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
