; DESCRIPTION: Draws a orange circle centered at (489, 110) with radius 14.
; PLAN: r0=489(x), r1=110(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 489
LDI r1, 110
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
