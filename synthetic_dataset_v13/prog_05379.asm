; DESCRIPTION: Draws a orange circle centered at (122, 15) with radius 14.
; PLAN: r0=122(x), r1=15(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 15
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
