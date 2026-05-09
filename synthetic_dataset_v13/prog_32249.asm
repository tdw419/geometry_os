; DESCRIPTION: Draws a orange circle centered at (132, 156) with radius 60.
; PLAN: r0=132(x), r1=156(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 156
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
