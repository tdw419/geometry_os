; DESCRIPTION: Draws a blue circle centered at (376, 183) with radius 50.
; PLAN: r0=376(x), r1=183(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 183
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
