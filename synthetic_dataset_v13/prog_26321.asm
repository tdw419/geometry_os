; DESCRIPTION: Creates a black circular shape at (165, 84) with radius 19.
; PLAN: r0=165(x), r1=84(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 84
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
