; DESCRIPTION: Sets a single white pixel at (13, 123).
; PLAN: r0=13(x), r1=123(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 123
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
