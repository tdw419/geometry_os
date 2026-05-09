; DESCRIPTION: Composite: Creates a purple rectangular region at (369, 34) spanning 64 by 30 pixels then Draws a orange line from (229, 156) to (170, 116) then Renders a orange disk with center (406, 116) and radius 78.
; PLAN: r0=369(x), r1=34(y), r2=64(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x1), r6=156(y1), r7=170(x2), r8=116(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=116(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 34
LDI r2, 64
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 156
LDI r7, 170
LDI r8, 116
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 116
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
