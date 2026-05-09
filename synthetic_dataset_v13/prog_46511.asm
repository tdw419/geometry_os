; DESCRIPTION: Composite: Places a yellow line segment connecting (32, 15) to (318, 230) then Creates a orange rectangular region at (214, 66) spanning 78 by 53 pixels then Places a green circle of radius 42 at center (281, 162).
; PLAN: r0=32(x1), r1=15(y1), r2=318(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=66(y), r7=78(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x), r11=162(y), r12=42(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 32
LDI r1, 15
LDI r2, 318
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 66
LDI r7, 78
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 162
LDI r12, 42
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
