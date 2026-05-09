; DESCRIPTION: Sets a single white pixel at (499, 251).
; PLAN: r0=499(x), r1=251(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 499
LDI r1, 251
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
