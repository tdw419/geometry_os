; DESCRIPTION: Creates a green circular shape at (88, 184) with radius 62.
; PLAN: r0=88(x), r1=184(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 184
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
