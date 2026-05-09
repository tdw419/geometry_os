; DESCRIPTION: Sets a single white pixel at (311, 46).
; PLAN: r0=311(x), r1=46(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 311
LDI r1, 46
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
