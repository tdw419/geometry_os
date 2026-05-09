; DESCRIPTION: Draws a magenta circle centered at (236, 229) with radius 15.
; PLAN: r0=236(x), r1=229(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 229
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
