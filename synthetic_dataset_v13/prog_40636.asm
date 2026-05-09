; DESCRIPTION: Creates a black circular shape at (454, 144) with radius 55.
; PLAN: r0=454(x), r1=144(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 144
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
