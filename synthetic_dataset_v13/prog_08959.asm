; DESCRIPTION: Draws a magenta circle centered at (375, 92) with radius 32.
; PLAN: r0=375(x), r1=92(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 92
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
