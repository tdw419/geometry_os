; DESCRIPTION: Sets a single white pixel at (24, 117).
; PLAN: r0=24(x), r1=117(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 117
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
