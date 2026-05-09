; DESCRIPTION: Draws a magenta circle centered at (360, 136) with radius 57.
; PLAN: r0=360(x), r1=136(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 136
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
