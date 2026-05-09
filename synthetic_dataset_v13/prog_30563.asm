; DESCRIPTION: Draws a magenta circle centered at (255, 189) with radius 38.
; PLAN: r0=255(x), r1=189(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 189
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
