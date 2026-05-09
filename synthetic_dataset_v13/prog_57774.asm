; DESCRIPTION: Draws a blue circle centered at (280, 94) with radius 74.
; PLAN: r0=280(x), r1=94(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 94
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
