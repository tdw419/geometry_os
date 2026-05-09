; DESCRIPTION: Draws a magenta circle centered at (160, 65) with radius 50.
; PLAN: r0=160(x), r1=65(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 65
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
