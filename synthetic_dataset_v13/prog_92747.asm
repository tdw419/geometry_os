; DESCRIPTION: Draws a magenta circle centered at (369, 46) with radius 36.
; PLAN: r0=369(x), r1=46(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 46
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
