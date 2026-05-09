; DESCRIPTION: Draws a blue circle centered at (456, 148) with radius 30.
; PLAN: r0=456(x), r1=148(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 148
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
