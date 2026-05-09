; DESCRIPTION: Places a white circle of radius 19 at center (182, 124).
; PLAN: r0=182(x), r1=124(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 124
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
