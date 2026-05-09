; DESCRIPTION: Draws a blue circle centered at (280, 60) with radius 58.
; PLAN: r0=280(x), r1=60(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 60
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
