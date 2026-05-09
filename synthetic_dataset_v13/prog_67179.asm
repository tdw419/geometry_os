; DESCRIPTION: Sets a single white pixel at (233, 199).
; PLAN: r0=233(x), r1=199(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 199
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
