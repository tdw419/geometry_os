; DESCRIPTION: Draws a blue circle centered at (175, 50) with radius 24.
; PLAN: r0=175(x), r1=50(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 50
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
