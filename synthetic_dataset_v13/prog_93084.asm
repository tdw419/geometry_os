; DESCRIPTION: Sets a single white pixel at (317, 99).
; PLAN: r0=317(x), r1=99(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 317
LDI r1, 99
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
