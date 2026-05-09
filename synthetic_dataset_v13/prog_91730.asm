; DESCRIPTION: Composite: Creates a purple rectangular region at (54, 148) spanning 28 by 13 pixels then Places a purple line segment connecting (28, 7) to (60, 204) then Draws a yellow circle centered at (332, 111) with radius 60.
; PLAN: r0=54(x), r1=148(y), r2=28(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=28(x1), r6=7(y1), r7=60(x2), r8=204(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=332(x), r11=111(y), r12=60(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 54
LDI r1, 148
LDI r2, 28
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 7
LDI r7, 60
LDI r8, 204
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 111
LDI r12, 60
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
