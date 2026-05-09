; DESCRIPTION: Composite: Creates a blue rectangular region at (207, 55) spanning 51 by 98 pixels then Creates a orange circular shape at (339, 98) with radius 63 then Draws a white line from (378, 198) to (483, 202).
; PLAN: r0=207(x), r1=55(y), r2=51(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=98(y), r7=63(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=378(x1), r11=198(y1), r12=483(x2), r13=202(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 55
LDI r2, 51
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 98
LDI r7, 63
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 378
LDI r11, 198
LDI r12, 483
LDI r13, 202
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
