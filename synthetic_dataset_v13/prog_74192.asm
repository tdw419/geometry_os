; DESCRIPTION: Sets a single white pixel at (7, 224).
; PLAN: r0=7(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
