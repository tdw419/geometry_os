; DESCRIPTION: Sets a single white pixel at (248, 68).
; PLAN: r0=248(x), r1=68(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 68
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
