; DESCRIPTION: Draws a magenta circle centered at (136, 54) with radius 27.
; PLAN: r0=136(x), r1=54(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 54
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
