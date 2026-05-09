; DESCRIPTION: Draws a blue circle centered at (255, 231) with radius 24.
; PLAN: r0=255(x), r1=231(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 231
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
