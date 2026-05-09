; DESCRIPTION: Sets a single white pixel at (153, 220).
; PLAN: r0=153(x), r1=220(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 220
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
