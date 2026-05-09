; DESCRIPTION: Draws a yellow circle centered at (69, 184) with radius 37.
; PLAN: r0=69(x), r1=184(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 184
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
