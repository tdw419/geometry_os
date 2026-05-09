; DESCRIPTION: Draws a green circle centered at (106, 181) with radius 65.
; PLAN: r0=106(x), r1=181(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 181
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
