; DESCRIPTION: Creates a yellow circular shape at (244, 175) with radius 58.
; PLAN: r0=244(x), r1=175(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 175
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
