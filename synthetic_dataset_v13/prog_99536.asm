; DESCRIPTION: Sets a single white pixel at (370, 131).
; PLAN: r0=370(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 370
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
