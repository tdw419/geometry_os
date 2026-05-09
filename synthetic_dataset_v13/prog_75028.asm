; DESCRIPTION: Composite: Draws a red circle centered at (222, 137) with radius 74 then Places a blue line segment connecting (74, 201) to (383, 213) then Creates a black rectangular region at (364, 158) spanning 76 by 27 pixels.
; PLAN: r0=222(x), r1=137(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x1), r6=201(y1), r7=383(x2), r8=213(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=364(x), r11=158(y), r12=76(width), r13=27(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 137
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 201
LDI r7, 383
LDI r8, 213
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 158
LDI r12, 76
LDI r13, 27
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
