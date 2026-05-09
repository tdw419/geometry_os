; DESCRIPTION: Creates a black circular shape at (223, 175) with radius 58.
; PLAN: r0=223(x), r1=175(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 175
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
