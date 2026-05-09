; DESCRIPTION: Composite: Places a orange line segment connecting (499, 152) to (15, 207) then Creates a green rectangular region at (273, 57) spanning 107 by 62 pixels then Places a red circle of radius 54 at center (354, 129).
; PLAN: r0=499(x1), r1=152(y1), r2=15(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=57(y), r7=107(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x), r11=129(y), r12=54(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 499
LDI r1, 152
LDI r2, 15
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 57
LDI r7, 107
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 129
LDI r12, 54
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
