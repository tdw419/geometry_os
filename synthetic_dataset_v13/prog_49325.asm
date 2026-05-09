; DESCRIPTION: Places a white circle of radius 20 at center (71, 88).
; PLAN: r0=71(x), r1=88(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 88
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
