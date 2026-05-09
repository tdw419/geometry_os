; DESCRIPTION: Creates a black circular shape at (223, 108) with radius 69.
; PLAN: r0=223(x), r1=108(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 108
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
