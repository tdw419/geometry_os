; DESCRIPTION: Sets a single white pixel at (466, 1).
; PLAN: r0=466(x), r1=1(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 466
LDI r1, 1
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
