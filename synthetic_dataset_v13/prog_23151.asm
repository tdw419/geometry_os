; DESCRIPTION: Composite: Creates a magenta circular shape at (250, 186) with radius 54 then Creates a black rectangular region at (101, 59) spanning 32 by 60 pixels then Places a magenta line segment connecting (296, 147) to (467, 21).
; PLAN: r0=250(x), r1=186(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x), r6=59(y), r7=32(width), r8=60(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x1), r11=147(y1), r12=467(x2), r13=21(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 186
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 59
LDI r7, 32
LDI r8, 60
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 147
LDI r12, 467
LDI r13, 21
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
