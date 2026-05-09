; DESCRIPTION: Sets a single white pixel at (250, 6).
; PLAN: r0=250(x), r1=6(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 6
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
