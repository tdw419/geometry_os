; DESCRIPTION: Draws a blue circle centered at (255, 14) with radius 14.
; PLAN: r0=255(x), r1=14(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 14
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
