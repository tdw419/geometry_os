; DESCRIPTION: Draws a orange circle centered at (278, 108) with radius 23.
; PLAN: r0=278(x), r1=108(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 108
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
