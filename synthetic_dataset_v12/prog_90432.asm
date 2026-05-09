; DESCRIPTION: Draws a orange circle centered at (264, 102) with radius 62.
; PLAN: r0=264(x), r1=102(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 102
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
