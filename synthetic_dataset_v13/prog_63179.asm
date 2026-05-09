; DESCRIPTION: Composite: Places a magenta line segment connecting (274, 185) to (414, 116) then Creates a magenta rectangular region at (274, 119) spanning 74 by 26 pixels then Creates a magenta circular shape at (68, 58) with radius 58.
; PLAN: r0=274(x1), r1=185(y1), r2=414(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=119(y), r7=74(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=58(y), r12=58(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 185
LDI r2, 414
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 119
LDI r7, 74
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 58
LDI r12, 58
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
