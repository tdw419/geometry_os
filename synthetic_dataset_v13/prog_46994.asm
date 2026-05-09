; DESCRIPTION: Sets a single white pixel at (471, 217).
; PLAN: r0=471(x), r1=217(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 471
LDI r1, 217
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
