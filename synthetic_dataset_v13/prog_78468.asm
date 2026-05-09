; DESCRIPTION: Creates a black circular shape at (385, 84) with radius 47.
; PLAN: r0=385(x), r1=84(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 84
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
