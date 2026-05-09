; DESCRIPTION: Composite: Renders a black line between points (186, 229) and (78, 90) then Creates a purple rectangular region at (166, 136) spanning 37 by 62 pixels then Places a black circle of radius 65 at center (332, 112).
; PLAN: r0=186(x1), r1=229(y1), r2=78(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=136(y), r7=37(width), r8=62(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=332(x), r11=112(y), r12=65(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 186
LDI r1, 229
LDI r2, 78
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 136
LDI r7, 37
LDI r8, 62
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 112
LDI r12, 65
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
