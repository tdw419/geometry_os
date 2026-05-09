; DESCRIPTION: Sets a single white pixel at (270, 135).
; PLAN: r0=270(x), r1=135(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 270
LDI r1, 135
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
