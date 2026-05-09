; DESCRIPTION: Composite: Places a green line segment connecting (259, 158) to (10, 236) then Creates a red rectangular region at (246, 207) spanning 112 by 22 pixels then Places a orange circle of radius 69 at center (273, 149).
; PLAN: r0=259(x1), r1=158(y1), r2=10(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=207(y), r7=112(width), r8=22(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x), r11=149(y), r12=69(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 158
LDI r2, 10
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 207
LDI r7, 112
LDI r8, 22
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 149
LDI r12, 69
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
