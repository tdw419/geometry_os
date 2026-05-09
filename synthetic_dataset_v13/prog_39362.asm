; DESCRIPTION: Draws a yellow circle centered at (206, 155) with radius 49.
; PLAN: r0=206(x), r1=155(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 155
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
