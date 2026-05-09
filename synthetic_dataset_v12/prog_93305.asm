; DESCRIPTION: Sets a single white pixel at (418, 185).
; PLAN: r0=418(x), r1=185(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 418
LDI r1, 185
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
