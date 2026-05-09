; DESCRIPTION: Sets a single white pixel at (205, 82).
; PLAN: r0=205(x), r1=82(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 82
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
