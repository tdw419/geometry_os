; DESCRIPTION: Draws a blue circle centered at (144, 54) with radius 54.
; PLAN: r0=144(x), r1=54(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 54
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
