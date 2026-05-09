; DESCRIPTION: Composite: Draws a orange circle centered at (316, 111) with radius 54 then Creates a purple rectangular region at (297, 36) spanning 60 by 37 pixels then Places a yellow line segment connecting (313, 144) to (199, 59).
; PLAN: r0=316(x), r1=111(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=36(y), r7=60(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x1), r11=144(y1), r12=199(x2), r13=59(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 111
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 36
LDI r7, 60
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 144
LDI r12, 199
LDI r13, 59
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
