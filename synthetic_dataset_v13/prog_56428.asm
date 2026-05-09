; DESCRIPTION: Sets a single white pixel at (344, 206).
; PLAN: r0=344(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
