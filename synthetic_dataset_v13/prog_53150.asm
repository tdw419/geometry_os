; DESCRIPTION: Draws a blue circle centered at (397, 168) with radius 45.
; PLAN: r0=397(x), r1=168(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 168
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
