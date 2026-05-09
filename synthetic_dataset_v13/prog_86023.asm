; DESCRIPTION: Composite: Places a blue circle of radius 78 at center (221, 174) then Places a black 85x21 rectangle at position (363, 209) then Draws a orange line from (355, 183) to (482, 70).
; PLAN: r0=221(x), r1=174(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=209(y), r7=85(width), r8=21(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=355(x1), r11=183(y1), r12=482(x2), r13=70(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 174
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 209
LDI r7, 85
LDI r8, 21
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 183
LDI r12, 482
LDI r13, 70
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
