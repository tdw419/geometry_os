; DESCRIPTION: Sets a single white pixel at (407, 94).
; PLAN: r0=407(x), r1=94(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 94
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
