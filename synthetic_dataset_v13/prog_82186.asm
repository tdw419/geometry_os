; DESCRIPTION: Sets a single white pixel at (114, 88).
; PLAN: r0=114(x), r1=88(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 88
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
