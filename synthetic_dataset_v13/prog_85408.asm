; DESCRIPTION: Draws a magenta circle centered at (229, 162) with radius 36.
; PLAN: r0=229(x), r1=162(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 162
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
