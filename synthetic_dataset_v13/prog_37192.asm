; DESCRIPTION: Sets a single white pixel at (435, 157).
; PLAN: r0=435(x), r1=157(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 435
LDI r1, 157
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
