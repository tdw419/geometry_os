; DESCRIPTION: Creates a yellow circular shape at (395, 88) with radius 19.
; PLAN: r0=395(x), r1=88(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 88
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
