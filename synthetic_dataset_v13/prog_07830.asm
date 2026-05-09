; DESCRIPTION: Sets a single white pixel at (148, 191).
; PLAN: r0=148(x), r1=191(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 191
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
