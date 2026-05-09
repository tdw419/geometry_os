; DESCRIPTION: Creates a green circular shape at (101, 88) with radius 46.
; PLAN: r0=101(x), r1=88(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 88
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
