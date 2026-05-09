; DESCRIPTION: Draws a magenta circle centered at (86, 55) with radius 10.
; PLAN: r0=86(x), r1=55(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 55
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
