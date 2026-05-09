; DESCRIPTION: Draws a magenta circle centered at (71, 188) with radius 55.
; PLAN: r0=71(x), r1=188(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 188
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
