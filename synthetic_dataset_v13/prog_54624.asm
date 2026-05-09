; DESCRIPTION: Sets a single white pixel at (323, 121).
; PLAN: r0=323(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 121
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
