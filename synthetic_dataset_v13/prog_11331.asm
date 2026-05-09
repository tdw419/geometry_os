; DESCRIPTION: Draws a green circle centered at (176, 184) with radius 69.
; PLAN: r0=176(x), r1=184(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 184
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
