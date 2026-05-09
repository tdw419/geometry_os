; DESCRIPTION: Composite: Creates a green circular shape at (165, 192) with radius 42 then Renders a blue box of size 81x62 starting at (342, 118) then Renders a purple line between points (489, 85) and (489, 75).
; PLAN: r0=165(x), r1=192(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=118(y), r7=81(width), r8=62(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x1), r11=85(y1), r12=489(x2), r13=75(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 192
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 118
LDI r7, 81
LDI r8, 62
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 85
LDI r12, 489
LDI r13, 75
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
