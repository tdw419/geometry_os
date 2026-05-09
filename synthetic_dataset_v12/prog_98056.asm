; DESCRIPTION: Composite: Places a orange 42x106 rectangle at position (424, 146) then Places a purple line segment connecting (336, 89) to (429, 192) then Draws a purple circle centered at (353, 155) with radius 77.
; PLAN: r0=424(x), r1=146(y), r2=42(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x1), r6=89(y1), r7=429(x2), r8=192(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=155(y), r12=77(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 424
LDI r1, 146
LDI r2, 42
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 89
LDI r7, 429
LDI r8, 192
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 155
LDI r12, 77
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
