; DESCRIPTION: Sets a single white pixel at (424, 145).
; PLAN: r0=424(x), r1=145(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 145
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
