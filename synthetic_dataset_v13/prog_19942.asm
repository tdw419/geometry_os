; DESCRIPTION: Sets a single white pixel at (5, 36).
; PLAN: r0=5(x), r1=36(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 36
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
