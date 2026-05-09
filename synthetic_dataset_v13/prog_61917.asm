; DESCRIPTION: Composite: Draws a orange line from (212, 224) to (26, 25) then Places a orange 77x43 rectangle at position (227, 78) then Draws a red circle centered at (108, 170) with radius 46.
; PLAN: r0=212(x1), r1=224(y1), r2=26(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=78(y), r7=77(width), r8=43(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=170(y), r12=46(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 212
LDI r1, 224
LDI r2, 26
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 78
LDI r7, 77
LDI r8, 43
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 170
LDI r12, 46
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
