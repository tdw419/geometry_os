; DESCRIPTION: Places a white circle of radius 44 at center (312, 78).
; PLAN: r0=312(x), r1=78(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 78
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
