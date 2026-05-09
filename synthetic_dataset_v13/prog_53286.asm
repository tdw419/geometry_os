; DESCRIPTION: Draws a green circle centered at (144, 91) with radius 63.
; PLAN: r0=144(x), r1=91(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 91
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
