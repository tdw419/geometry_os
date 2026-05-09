; DESCRIPTION: Draws a green circle centered at (369, 138) with radius 20.
; PLAN: r0=369(x), r1=138(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 138
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
