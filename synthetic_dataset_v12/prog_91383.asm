; DESCRIPTION: Draws a blue circle centered at (142, 185) with radius 50.
; PLAN: r0=142(x), r1=185(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 185
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
