; DESCRIPTION: Sets a single white pixel at (369, 187).
; PLAN: r0=369(x), r1=187(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 369
LDI r1, 187
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
