; DESCRIPTION: Composite: Creates a yellow circular shape at (166, 156) with radius 18 then Creates a yellow rectangular region at (314, 100) spanning 22 by 50 pixels then Renders a black line between points (66, 174) and (229, 172).
; PLAN: r0=166(x), r1=156(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=100(y), r7=22(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=66(x1), r11=174(y1), r12=229(x2), r13=172(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 156
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 100
LDI r7, 22
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 174
LDI r12, 229
LDI r13, 172
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
