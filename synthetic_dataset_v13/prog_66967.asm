; DESCRIPTION: Places a white circle of radius 43 at center (312, 105).
; PLAN: r0=312(x), r1=105(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 105
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
