; DESCRIPTION: Draws a green circle centered at (430, 78) with radius 44.
; PLAN: r0=430(x), r1=78(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 78
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
