; DESCRIPTION: Draws a magenta circle centered at (274, 210) with radius 29.
; PLAN: r0=274(x), r1=210(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 210
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
