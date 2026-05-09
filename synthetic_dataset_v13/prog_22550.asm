; DESCRIPTION: Draws a magenta circle centered at (200, 72) with radius 16.
; PLAN: r0=200(x), r1=72(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 72
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
