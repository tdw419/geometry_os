; DESCRIPTION: Composite: Places a green line segment connecting (262, 159) to (109, 252) then Creates a yellow rectangular region at (10, 192) spanning 84 by 61 pixels then Sets a single black pixel at (166, 137).
; PLAN: r0=262(x1), r1=159(y1), r2=109(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=192(y), r7=84(width), r8=61(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=166(x), r11=137(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 262
LDI r1, 159
LDI r2, 109
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 192
LDI r7, 84
LDI r8, 61
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 137
LDI r12, 0x000000
PSET r10, r11, r12
HALT
