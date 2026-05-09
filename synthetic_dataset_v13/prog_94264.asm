; DESCRIPTION: Draws a yellow circle centered at (70, 153) with radius 22.
; PLAN: r0=70(x), r1=153(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 153
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
