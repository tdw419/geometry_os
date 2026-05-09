; DESCRIPTION: Draws a blue circle centered at (273, 139) with radius 79.
; PLAN: r0=273(x), r1=139(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 139
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
