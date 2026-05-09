; DESCRIPTION: Draws a green circle centered at (430, 102) with radius 54.
; PLAN: r0=430(x), r1=102(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 102
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
