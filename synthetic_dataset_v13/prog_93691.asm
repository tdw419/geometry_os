; DESCRIPTION: Sets a single white pixel at (4, 143).
; PLAN: r0=4(x), r1=143(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 143
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
