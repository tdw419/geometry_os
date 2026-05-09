; DESCRIPTION: Composite: Places a magenta line segment connecting (509, 201) to (338, 118) then Creates a magenta rectangular region at (351, 143) spanning 103 by 38 pixels then Draws a orange circle centered at (107, 165) with radius 28.
; PLAN: r0=509(x1), r1=201(y1), r2=338(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=143(y), r7=103(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x), r11=165(y), r12=28(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 509
LDI r1, 201
LDI r2, 338
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 143
LDI r7, 103
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 165
LDI r12, 28
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
