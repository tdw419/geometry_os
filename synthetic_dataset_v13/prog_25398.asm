; DESCRIPTION: Creates a black circular shape at (385, 103) with radius 55.
; PLAN: r0=385(x), r1=103(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 103
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
