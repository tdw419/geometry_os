; DESCRIPTION: Draws a blue circle centered at (81, 184) with radius 70.
; PLAN: r0=81(x), r1=184(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 184
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
