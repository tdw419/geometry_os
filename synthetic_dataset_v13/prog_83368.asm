; DESCRIPTION: Sets a single white pixel at (153, 15).
; PLAN: r0=153(x), r1=15(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 15
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
