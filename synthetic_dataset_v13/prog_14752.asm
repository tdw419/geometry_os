; DESCRIPTION: Sets a single white pixel at (456, 200).
; PLAN: r0=456(x), r1=200(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 456
LDI r1, 200
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
