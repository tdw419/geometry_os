; DESCRIPTION: Draws a orange circle centered at (430, 161) with radius 62.
; PLAN: r0=430(x), r1=161(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 161
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
