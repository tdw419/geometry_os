; DESCRIPTION: Draws a orange circle centered at (302, 149) with radius 62.
; PLAN: r0=302(x), r1=149(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 149
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
