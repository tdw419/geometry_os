; DESCRIPTION: Sets a single white pixel at (195, 232).
; PLAN: r0=195(x), r1=232(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 232
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
