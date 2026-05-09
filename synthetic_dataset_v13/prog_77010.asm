; DESCRIPTION: Draws a magenta circle centered at (184, 138) with radius 30.
; PLAN: r0=184(x), r1=138(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 138
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
