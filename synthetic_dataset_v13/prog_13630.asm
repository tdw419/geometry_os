; DESCRIPTION: Draws a magenta circle centered at (459, 38) with radius 28.
; PLAN: r0=459(x), r1=38(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 38
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
