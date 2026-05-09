; DESCRIPTION: Draws a green circle centered at (275, 84) with radius 78.
; PLAN: r0=275(x), r1=84(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 84
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
