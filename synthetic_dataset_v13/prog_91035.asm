; DESCRIPTION: Sets a single white pixel at (279, 110).
; PLAN: r0=279(x), r1=110(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 279
LDI r1, 110
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
