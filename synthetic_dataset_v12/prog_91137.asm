; DESCRIPTION: Draws a yellow circle centered at (369, 54) with radius 22.
; PLAN: r0=369(x), r1=54(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 54
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
