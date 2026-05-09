; DESCRIPTION: Sets a single white pixel at (88, 233).
; PLAN: r0=88(x), r1=233(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 233
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
