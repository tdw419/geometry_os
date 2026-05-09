; DESCRIPTION: Sets a single white pixel at (462, 53).
; PLAN: r0=462(x), r1=53(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 462
LDI r1, 53
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
