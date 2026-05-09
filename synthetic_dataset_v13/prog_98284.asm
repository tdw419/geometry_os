; DESCRIPTION: Sets a single white pixel at (239, 168).
; PLAN: r0=239(x), r1=168(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 168
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
