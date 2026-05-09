; DESCRIPTION: Draws a green circle centered at (43, 199) with radius 25.
; PLAN: r0=43(x), r1=199(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 199
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
