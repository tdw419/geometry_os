; DESCRIPTION: Composite: Places a magenta line segment connecting (400, 110) to (4, 227) then Creates a magenta rectangular region at (405, 158) spanning 69 by 13 pixels then Creates a yellow circular shape at (201, 55) with radius 26.
; PLAN: r0=400(x1), r1=110(y1), r2=4(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=158(y), r7=69(width), r8=13(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x), r11=55(y), r12=26(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 400
LDI r1, 110
LDI r2, 4
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 158
LDI r7, 69
LDI r8, 13
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 55
LDI r12, 26
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
