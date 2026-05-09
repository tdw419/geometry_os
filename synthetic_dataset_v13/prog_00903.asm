; DESCRIPTION: Composite: Creates a black rectangular region at (224, 46) spanning 39 by 19 pixels then Draws a purple line from (264, 43) to (314, 198) then Creates a white circular shape at (70, 127) with radius 39.
; PLAN: r0=224(x), r1=46(y), r2=39(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x1), r6=43(y1), r7=314(x2), r8=198(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=127(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 224
LDI r1, 46
LDI r2, 39
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 43
LDI r7, 314
LDI r8, 198
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 127
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
