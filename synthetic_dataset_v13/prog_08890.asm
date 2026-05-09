; DESCRIPTION: Creates a yellow circular shape at (456, 88) with radius 28.
; PLAN: r0=456(x), r1=88(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 88
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
