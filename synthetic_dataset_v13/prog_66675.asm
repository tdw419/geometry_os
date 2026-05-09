; DESCRIPTION: Sets a single white pixel at (492, 170).
; PLAN: r0=492(x), r1=170(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 492
LDI r1, 170
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
