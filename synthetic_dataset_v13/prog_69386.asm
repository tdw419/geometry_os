; DESCRIPTION: Draws a yellow circle centered at (29, 69) with radius 23.
; PLAN: r0=29(x), r1=69(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 69
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
