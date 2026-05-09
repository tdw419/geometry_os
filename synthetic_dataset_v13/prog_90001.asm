; DESCRIPTION: Composite: Draws a green line from (373, 223) to (331, 75) then Creates a yellow rectangular region at (105, 11) spanning 50 by 62 pixels then Places a red circle of radius 56 at center (71, 198).
; PLAN: r0=373(x1), r1=223(y1), r2=331(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=11(y), r7=50(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x), r11=198(y), r12=56(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 223
LDI r2, 331
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 11
LDI r7, 50
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 198
LDI r12, 56
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
