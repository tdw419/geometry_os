; DESCRIPTION: Sets a single white pixel at (304, 97).
; PLAN: r0=304(x), r1=97(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 304
LDI r1, 97
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
