; DESCRIPTION: Draws a yellow circle centered at (99, 105) with radius 54.
; PLAN: r0=99(x), r1=105(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 105
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
