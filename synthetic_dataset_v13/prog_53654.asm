; DESCRIPTION: Draws a magenta circle centered at (350, 179) with radius 28.
; PLAN: r0=350(x), r1=179(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 179
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
