; DESCRIPTION: Draws a yellow circle centered at (88, 78) with radius 58.
; PLAN: r0=88(x), r1=78(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 78
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
