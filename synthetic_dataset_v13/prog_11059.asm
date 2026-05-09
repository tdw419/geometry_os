; DESCRIPTION: Composite: Places a yellow line segment connecting (248, 55) to (492, 193) then Creates a green rectangular region at (195, 72) spanning 46 by 109 pixels then Places a black circle of radius 26 at center (469, 179).
; PLAN: r0=248(x1), r1=55(y1), r2=492(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=72(y), r7=46(width), r8=109(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=469(x), r11=179(y), r12=26(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 55
LDI r2, 492
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 72
LDI r7, 46
LDI r8, 109
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 179
LDI r12, 26
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
