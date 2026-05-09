; DESCRIPTION: Sets a single white pixel at (454, 142).
; PLAN: r0=454(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 454
LDI r1, 142
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
