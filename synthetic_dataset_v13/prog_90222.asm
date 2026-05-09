; DESCRIPTION: Composite: Renders a blue disk with center (237, 158) and radius 43 then Draws a yellow line from (156, 62) to (354, 55) then Draws a orange rectangle at (347, 40) with width 97 and height 10.
; PLAN: r0=237(x), r1=158(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x1), r6=62(y1), r7=354(x2), r8=55(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=40(y), r12=97(width), r13=10(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 158
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 62
LDI r7, 354
LDI r8, 55
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 40
LDI r12, 97
LDI r13, 10
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
