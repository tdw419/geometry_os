; DESCRIPTION: Composite: Creates a red rectangular region at (26, 139) spanning 17 by 112 pixels then Places a black line segment connecting (348, 107) to (43, 231) then Creates a purple circular shape at (170, 86) with radius 64.
; PLAN: r0=26(x), r1=139(y), r2=17(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x1), r6=107(y1), r7=43(x2), r8=231(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=170(x), r11=86(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 26
LDI r1, 139
LDI r2, 17
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 107
LDI r7, 43
LDI r8, 231
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 86
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
