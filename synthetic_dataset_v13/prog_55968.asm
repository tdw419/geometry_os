; DESCRIPTION: Draws a orange circle centered at (193, 84) with radius 22.
; PLAN: r0=193(x), r1=84(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 84
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
