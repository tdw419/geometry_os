; DESCRIPTION: Draws a magenta circle centered at (280, 172) with radius 70.
; PLAN: r0=280(x), r1=172(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 172
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
