; DESCRIPTION: Draws a orange circle centered at (132, 101) with radius 80.
; PLAN: r0=132(x), r1=101(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 101
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
