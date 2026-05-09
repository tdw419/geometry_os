; DESCRIPTION: Draws a green circle centered at (84, 183) with radius 47.
; PLAN: r0=84(x), r1=183(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 183
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
