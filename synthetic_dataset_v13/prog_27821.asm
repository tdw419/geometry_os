; DESCRIPTION: Sets a single white pixel at (332, 200).
; PLAN: r0=332(x), r1=200(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 332
LDI r1, 200
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
