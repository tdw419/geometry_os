; DESCRIPTION: Draws a blue circle centered at (415, 86) with radius 54.
; PLAN: r0=415(x), r1=86(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 86
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
