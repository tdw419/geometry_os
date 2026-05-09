; DESCRIPTION: Sets a single white pixel at (398, 223).
; PLAN: r0=398(x), r1=223(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 223
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
