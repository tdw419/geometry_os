; DESCRIPTION: Draws a blue circle centered at (216, 108) with radius 79.
; PLAN: r0=216(x), r1=108(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 108
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
