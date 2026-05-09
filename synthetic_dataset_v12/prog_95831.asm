; DESCRIPTION: Sets a single white pixel at (238, 179).
; PLAN: r0=238(x), r1=179(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 179
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
