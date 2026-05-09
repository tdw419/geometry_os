; DESCRIPTION: Draws a magenta circle centered at (278, 63) with radius 48.
; PLAN: r0=278(x), r1=63(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 63
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
