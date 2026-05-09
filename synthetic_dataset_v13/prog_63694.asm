; DESCRIPTION: Draws a blue circle centered at (375, 103) with radius 58.
; PLAN: r0=375(x), r1=103(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 103
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
