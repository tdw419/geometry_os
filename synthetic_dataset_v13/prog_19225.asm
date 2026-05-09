; DESCRIPTION: Draws a green circle centered at (359, 233) with radius 11.
; PLAN: r0=359(x), r1=233(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 233
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
