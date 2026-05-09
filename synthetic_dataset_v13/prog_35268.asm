; DESCRIPTION: Draws a blue circle centered at (219, 171) with radius 63.
; PLAN: r0=219(x), r1=171(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 171
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
