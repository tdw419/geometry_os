; DESCRIPTION: Composite: Renders a yellow line between points (324, 78) and (26, 100) then Draws a green rectangle at (29, 23) with width 43 and height 86 then Draws a black circle centered at (93, 155) with radius 50.
; PLAN: r0=324(x1), r1=78(y1), r2=26(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=23(y), r7=43(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x), r11=155(y), r12=50(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 78
LDI r2, 26
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 23
LDI r7, 43
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 155
LDI r12, 50
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
