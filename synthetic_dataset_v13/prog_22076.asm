; DESCRIPTION: Composite: Draws a orange circle centered at (389, 184) with radius 62 then Creates a magenta rectangular region at (155, 11) spanning 106 by 13 pixels.
; PLAN: r0=389(x), r1=184(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=11(y), r7=106(width), r8=13(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 184
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 11
LDI r7, 106
LDI r8, 13
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
