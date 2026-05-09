; DESCRIPTION: Sets a single white pixel at (440, 105).
; PLAN: r0=440(x), r1=105(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 440
LDI r1, 105
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
