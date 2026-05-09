; DESCRIPTION: Draws a blue circle centered at (108, 174) with radius 69.
; PLAN: r0=108(x), r1=174(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 174
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
