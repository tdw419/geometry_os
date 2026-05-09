; DESCRIPTION: Sets a single white pixel at (351, 149).
; PLAN: r0=351(x), r1=149(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 351
LDI r1, 149
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
