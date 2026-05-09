; DESCRIPTION: Composite: Draws a red line from (423, 18) to (99, 146) then Creates a blue rectangular region at (4, 132) spanning 54 by 23 pixels then Draws a orange circle centered at (97, 48) with radius 45.
; PLAN: r0=423(x1), r1=18(y1), r2=99(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=4(x), r6=132(y), r7=54(width), r8=23(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x), r11=48(y), r12=45(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 423
LDI r1, 18
LDI r2, 99
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 132
LDI r7, 54
LDI r8, 23
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 48
LDI r12, 45
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
