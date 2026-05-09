; DESCRIPTION: Sets a single white pixel at (375, 35).
; PLAN: r0=375(x), r1=35(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 375
LDI r1, 35
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
