; DESCRIPTION: Draws a magenta circle centered at (369, 159) with radius 33.
; PLAN: r0=369(x), r1=159(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 159
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
