; DESCRIPTION: Draws a magenta circle centered at (455, 87) with radius 32.
; PLAN: r0=455(x), r1=87(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 87
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
