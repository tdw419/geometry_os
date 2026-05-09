; DESCRIPTION: Sets a single white pixel at (170, 133).
; PLAN: r0=170(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 133
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
