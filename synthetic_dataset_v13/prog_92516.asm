; DESCRIPTION: Sets a single white pixel at (137, 232).
; PLAN: r0=137(x), r1=232(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 232
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
