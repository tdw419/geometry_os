; DESCRIPTION: Sets a single white pixel at (291, 2).
; PLAN: r0=291(x), r1=2(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 291
LDI r1, 2
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
