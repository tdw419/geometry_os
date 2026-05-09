; DESCRIPTION: Draws a magenta circle centered at (54, 117) with radius 36.
; PLAN: r0=54(x), r1=117(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 117
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
