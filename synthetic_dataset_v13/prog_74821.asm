; DESCRIPTION: Sets a single white pixel at (343, 20).
; PLAN: r0=343(x), r1=20(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 343
LDI r1, 20
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
