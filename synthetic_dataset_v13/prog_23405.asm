; DESCRIPTION: Composite: Creates a orange rectangular region at (364, 143) spanning 86 by 47 pixels then Renders a red line between points (211, 167) and (41, 222) then Renders a black disk with center (356, 57) and radius 57.
; PLAN: r0=364(x), r1=143(y), r2=86(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x1), r6=167(y1), r7=41(x2), r8=222(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=356(x), r11=57(y), r12=57(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 143
LDI r2, 86
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 167
LDI r7, 41
LDI r8, 222
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 57
LDI r12, 57
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
