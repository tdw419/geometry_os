; DESCRIPTION: Sets a single white pixel at (94, 37).
; PLAN: r0=94(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
