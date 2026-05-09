; DESCRIPTION: Places a white circle of radius 25 at center (276, 124).
; PLAN: r0=276(x), r1=124(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 124
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
