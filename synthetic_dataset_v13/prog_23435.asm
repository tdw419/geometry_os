; DESCRIPTION: Draws a magenta circle centered at (453, 99) with radius 48.
; PLAN: r0=453(x), r1=99(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 99
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
