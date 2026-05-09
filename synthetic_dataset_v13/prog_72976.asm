; DESCRIPTION: Composite: Draws a yellow circle centered at (205, 160) with radius 41 then Creates a green rectangular region at (313, 185) spanning 97 by 11 pixels.
; PLAN: r0=205(x), r1=160(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x), r6=185(y), r7=97(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 160
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 185
LDI r7, 97
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
