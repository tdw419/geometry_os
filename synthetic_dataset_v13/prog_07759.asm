; DESCRIPTION: Draws a magenta circle centered at (32, 97) with radius 32.
; PLAN: r0=32(x), r1=97(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 97
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
