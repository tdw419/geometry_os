; DESCRIPTION: Draws a blue circle centered at (80, 32) with radius 10.
; PLAN: r0=80(x), r1=32(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 32
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
