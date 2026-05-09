; DESCRIPTION: Sets a single white pixel at (474, 165).
; PLAN: r0=474(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 474
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
