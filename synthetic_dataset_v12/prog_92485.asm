; DESCRIPTION: Draws a blue circle centered at (376, 100) with radius 16.
; PLAN: r0=376(x), r1=100(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 100
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
