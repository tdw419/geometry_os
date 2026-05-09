; DESCRIPTION: Sets a single white pixel at (384, 120).
; PLAN: r0=384(x), r1=120(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 384
LDI r1, 120
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
