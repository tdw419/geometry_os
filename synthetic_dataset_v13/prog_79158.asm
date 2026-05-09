; DESCRIPTION: Sets a single white pixel at (459, 66).
; PLAN: r0=459(x), r1=66(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 459
LDI r1, 66
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
