; DESCRIPTION: Places a white circle of radius 20 at center (217, 72).
; PLAN: r0=217(x), r1=72(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 72
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
