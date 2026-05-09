; DESCRIPTION: Draws a blue circle centered at (335, 149) with radius 67.
; PLAN: r0=335(x), r1=149(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 149
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
