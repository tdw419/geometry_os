; DESCRIPTION: Draws a blue circle centered at (145, 103) with radius 47.
; PLAN: r0=145(x), r1=103(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 103
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
