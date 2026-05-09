; DESCRIPTION: Draws a magenta circle centered at (397, 145) with radius 21.
; PLAN: r0=397(x), r1=145(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 145
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
