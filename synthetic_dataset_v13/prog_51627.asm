; DESCRIPTION: Draws a magenta circle centered at (65, 180) with radius 37.
; PLAN: r0=65(x), r1=180(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 180
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
