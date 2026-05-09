; DESCRIPTION: Sets a single white pixel at (329, 238).
; PLAN: r0=329(x), r1=238(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 238
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
