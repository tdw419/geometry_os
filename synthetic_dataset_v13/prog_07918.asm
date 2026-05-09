; DESCRIPTION: Composite: Places a cyan line segment connecting (414, 50) to (318, 12) then Creates a purple rectangular region at (313, 67) spanning 110 by 56 pixels then Renders a red disk with center (272, 105) and radius 80.
; PLAN: r0=414(x1), r1=50(y1), r2=318(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=67(y), r7=110(width), r8=56(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=105(y), r12=80(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 414
LDI r1, 50
LDI r2, 318
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 67
LDI r7, 110
LDI r8, 56
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 105
LDI r12, 80
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
