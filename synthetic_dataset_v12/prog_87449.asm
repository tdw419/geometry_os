; DESCRIPTION: Sets a single white pixel at (30, 80).
; PLAN: r0=30(x), r1=80(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 80
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
