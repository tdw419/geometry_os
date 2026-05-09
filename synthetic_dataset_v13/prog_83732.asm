; DESCRIPTION: Draws a blue circle centered at (79, 88) with radius 16.
; PLAN: r0=79(x), r1=88(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 88
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
