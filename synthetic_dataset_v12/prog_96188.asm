; DESCRIPTION: Draws a blue circle centered at (397, 63) with radius 51.
; PLAN: r0=397(x), r1=63(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 63
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
