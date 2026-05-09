; DESCRIPTION: Draws a blue circle centered at (116, 37) with radius 30.
; PLAN: r0=116(x), r1=37(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 37
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
