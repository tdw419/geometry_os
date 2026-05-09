; DESCRIPTION: Composite: Places a blue 100x85 rectangle at position (38, 169) then Draws a orange line from (489, 40) to (382, 20) then Places a purple circle of radius 58 at center (132, 157).
; PLAN: r0=38(x), r1=169(y), r2=100(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=489(x1), r6=40(y1), r7=382(x2), r8=20(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=157(y), r12=58(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 38
LDI r1, 169
LDI r2, 100
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 40
LDI r7, 382
LDI r8, 20
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 157
LDI r12, 58
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
