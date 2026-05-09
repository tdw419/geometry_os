; DESCRIPTION: Sets a single white pixel at (428, 133).
; PLAN: r0=428(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 428
LDI r1, 133
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
