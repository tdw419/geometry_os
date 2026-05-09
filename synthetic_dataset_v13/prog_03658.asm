; DESCRIPTION: Draws a magenta circle centered at (374, 119) with radius 75.
; PLAN: r0=374(x), r1=119(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 119
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
