; DESCRIPTION: Composite: Draws a orange circle centered at (287, 188) with radius 31 then Creates a purple rectangular region at (357, 166) spanning 69 by 24 pixels.
; PLAN: r0=287(x), r1=188(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=166(y), r7=69(width), r8=24(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 188
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 166
LDI r7, 69
LDI r8, 24
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
