; DESCRIPTION: Sets a single white pixel at (201, 122).
; PLAN: r0=201(x), r1=122(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 122
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
