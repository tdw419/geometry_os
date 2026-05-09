; DESCRIPTION: Creates a black circular shape at (385, 142) with radius 78.
; PLAN: r0=385(x), r1=142(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 142
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
