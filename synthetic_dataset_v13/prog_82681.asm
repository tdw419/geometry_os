; DESCRIPTION: Draws a green circle centered at (353, 199) with radius 54.
; PLAN: r0=353(x), r1=199(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 199
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
