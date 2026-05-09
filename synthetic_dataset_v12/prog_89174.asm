; DESCRIPTION: Draws a orange circle centered at (43, 68) with radius 18.
; PLAN: r0=43(x), r1=68(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 68
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
