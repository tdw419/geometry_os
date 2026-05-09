; DESCRIPTION: Draws a magenta circle centered at (255, 104) with radius 62.
; PLAN: r0=255(x), r1=104(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 104
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
