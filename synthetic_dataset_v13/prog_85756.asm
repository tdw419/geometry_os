; DESCRIPTION: Draws a green circle centered at (489, 234) with radius 15.
; PLAN: r0=489(x), r1=234(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 489
LDI r1, 234
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
