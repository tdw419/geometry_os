; DESCRIPTION: Composite: Renders a purple disk with center (216, 37) and radius 34 then Creates a cyan rectangular region at (364, 89) spanning 75 by 66 pixels then Places a orange line segment connecting (122, 216) to (161, 30).
; PLAN: r0=216(x), r1=37(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=89(y), r7=75(width), r8=66(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x1), r11=216(y1), r12=161(x2), r13=30(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 37
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 89
LDI r7, 75
LDI r8, 66
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 216
LDI r12, 161
LDI r13, 30
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
