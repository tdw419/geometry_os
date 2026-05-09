; DESCRIPTION: Draws a magenta circle centered at (145, 104) with radius 32.
; PLAN: r0=145(x), r1=104(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 104
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
