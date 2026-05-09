; DESCRIPTION: Composite: Creates a black rectangular region at (414, 227) spanning 79 by 19 pixels then Renders a orange line between points (446, 203) and (439, 99) then Creates a cyan circular shape at (45, 27) with radius 12.
; PLAN: r0=414(x), r1=227(y), r2=79(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x1), r6=203(y1), r7=439(x2), r8=99(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=27(y), r12=12(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 414
LDI r1, 227
LDI r2, 79
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 203
LDI r7, 439
LDI r8, 99
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 27
LDI r12, 12
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
