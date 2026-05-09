; DESCRIPTION: Sets a single white pixel at (297, 194).
; PLAN: r0=297(x), r1=194(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 297
LDI r1, 194
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
