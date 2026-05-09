; DESCRIPTION: Composite: Creates a orange circular shape at (355, 59) with radius 13 then Draws a orange rectangle at (317, 99) with width 85 and height 43 then Draws a red line from (150, 60) to (505, 159).
; PLAN: r0=355(x), r1=59(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=99(y), r7=85(width), r8=43(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=150(x1), r11=60(y1), r12=505(x2), r13=159(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 59
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 99
LDI r7, 85
LDI r8, 43
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 60
LDI r12, 505
LDI r13, 159
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
