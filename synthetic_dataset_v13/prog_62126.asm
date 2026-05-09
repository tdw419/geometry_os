; DESCRIPTION: Composite: Places a purple circle of radius 41 at center (300, 205) then Places a black 34x37 rectangle at position (3, 47) then Places a green line segment connecting (80, 222) to (364, 181).
; PLAN: r0=300(x), r1=205(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=47(y), r7=34(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x1), r11=222(y1), r12=364(x2), r13=181(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 205
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 47
LDI r7, 34
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 222
LDI r12, 364
LDI r13, 181
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
