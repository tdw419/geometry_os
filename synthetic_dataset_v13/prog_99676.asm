; DESCRIPTION: Draws a blue circle centered at (147, 59) with radius 11.
; PLAN: r0=147(x), r1=59(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 59
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
