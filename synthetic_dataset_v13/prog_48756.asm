; DESCRIPTION: Draws a magenta circle centered at (442, 219) with radius 20.
; PLAN: r0=442(x), r1=219(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 219
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
