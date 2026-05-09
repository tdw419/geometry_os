; DESCRIPTION: Places a white circle of radius 17 at center (203, 124).
; PLAN: r0=203(x), r1=124(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 124
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
