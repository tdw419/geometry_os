; DESCRIPTION: Draws a magenta circle centered at (70, 144) with radius 40.
; PLAN: r0=70(x), r1=144(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 144
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
