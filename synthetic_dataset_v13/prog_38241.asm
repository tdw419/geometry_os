; DESCRIPTION: Composite: Renders a purple line between points (185, 176) and (99, 170) then Creates a black rectangular region at (354, 176) spanning 47 by 17 pixels then Creates a yellow circular shape at (142, 126) with radius 56.
; PLAN: r0=185(x1), r1=176(y1), r2=99(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=176(y), r7=47(width), r8=17(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=142(x), r11=126(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 185
LDI r1, 176
LDI r2, 99
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 176
LDI r7, 47
LDI r8, 17
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 126
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
