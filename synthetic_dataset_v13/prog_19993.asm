; DESCRIPTION: Sets a single white pixel at (246, 39).
; PLAN: r0=246(x), r1=39(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 39
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
