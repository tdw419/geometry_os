; DESCRIPTION: Sets a single white pixel at (448, 224).
; PLAN: r0=448(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
