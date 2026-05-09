; DESCRIPTION: Draws a magenta circle centered at (110, 79) with radius 50.
; PLAN: r0=110(x), r1=79(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 79
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
