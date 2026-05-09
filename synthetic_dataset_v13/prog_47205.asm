; DESCRIPTION: Sets a single white pixel at (395, 131).
; PLAN: r0=395(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 395
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
