; DESCRIPTION: Draws a green circle centered at (190, 181) with radius 75.
; PLAN: r0=190(x), r1=181(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 181
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
