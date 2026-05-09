; DESCRIPTION: Sets a single white pixel at (403, 33).
; PLAN: r0=403(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 403
LDI r1, 33
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
