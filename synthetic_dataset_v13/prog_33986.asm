; DESCRIPTION: Sets a single white pixel at (136, 18).
; PLAN: r0=136(x), r1=18(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 18
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
