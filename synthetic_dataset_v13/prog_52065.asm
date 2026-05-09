; DESCRIPTION: Sets a single white pixel at (319, 199).
; PLAN: r0=319(x), r1=199(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 319
LDI r1, 199
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
