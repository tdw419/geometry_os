; DESCRIPTION: Sets a single white pixel at (87, 17).
; PLAN: r0=87(x), r1=17(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 17
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
