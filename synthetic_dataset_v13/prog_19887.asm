; DESCRIPTION: Sets a single white pixel at (219, 230).
; PLAN: r0=219(x), r1=230(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 230
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
