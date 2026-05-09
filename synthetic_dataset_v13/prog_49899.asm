; DESCRIPTION: Sets a single white pixel at (239, 219).
; PLAN: r0=239(x), r1=219(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 219
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
