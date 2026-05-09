; DESCRIPTION: Draws a blue circle centered at (406, 72) with radius 62.
; PLAN: r0=406(x), r1=72(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 72
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
