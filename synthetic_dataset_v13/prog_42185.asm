; DESCRIPTION: Sets a single white pixel at (251, 55).
; PLAN: r0=251(x), r1=55(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 55
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
