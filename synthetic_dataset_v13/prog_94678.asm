; DESCRIPTION: Composite: Places a orange line segment connecting (181, 91) to (408, 22) then Creates a cyan circular shape at (478, 203) with radius 26 then Places a yellow 78x96 rectangle at position (374, 23).
; PLAN: r0=181(x1), r1=91(y1), r2=408(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=203(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=23(y), r12=78(width), r13=96(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 91
LDI r2, 408
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 203
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 23
LDI r12, 78
LDI r13, 96
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
