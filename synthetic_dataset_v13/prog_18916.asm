; DESCRIPTION: Sets a single white pixel at (303, 144).
; PLAN: r0=303(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 303
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
