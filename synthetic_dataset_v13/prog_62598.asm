; DESCRIPTION: Composite: Creates a cyan rectangular region at (314, 9) spanning 10 by 97 pixels then Places a orange line segment connecting (230, 166) to (332, 209) then Creates a white circular shape at (158, 44) with radius 32.
; PLAN: r0=314(x), r1=9(y), r2=10(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x1), r6=166(y1), r7=332(x2), r8=209(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=158(x), r11=44(y), r12=32(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 9
LDI r2, 10
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 166
LDI r7, 332
LDI r8, 209
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 44
LDI r12, 32
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
