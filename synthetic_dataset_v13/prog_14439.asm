; DESCRIPTION: Draws a magenta circle centered at (431, 50) with radius 16.
; PLAN: r0=431(x), r1=50(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 50
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
