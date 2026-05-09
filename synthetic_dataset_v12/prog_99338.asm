; DESCRIPTION: Places a white circle of radius 70 at center (217, 130).
; PLAN: r0=217(x), r1=130(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 130
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
