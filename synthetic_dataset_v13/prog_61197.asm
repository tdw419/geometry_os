; DESCRIPTION: Composite: Draws a blue circle centered at (408, 219) with radius 29 then Creates a orange rectangular region at (68, 25) spanning 107 by 97 pixels.
; PLAN: r0=408(x), r1=219(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=25(y), r7=107(width), r8=97(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 219
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 25
LDI r7, 107
LDI r8, 97
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
