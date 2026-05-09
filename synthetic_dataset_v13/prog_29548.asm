; DESCRIPTION: Draws a blue circle centered at (72, 233) with radius 23.
; PLAN: r0=72(x), r1=233(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 233
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
