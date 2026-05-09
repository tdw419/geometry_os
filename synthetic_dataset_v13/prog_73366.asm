; DESCRIPTION: Draws a orange circle centered at (56, 84) with radius 11.
; PLAN: r0=56(x), r1=84(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 84
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
