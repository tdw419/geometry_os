; DESCRIPTION: Creates a black circular shape at (270, 35) with radius 18.
; PLAN: r0=270(x), r1=35(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 35
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
