; DESCRIPTION: Composite: Draws a purple line from (483, 137) to (340, 135) then Sets a single purple pixel at (475, 159) then Draws a green rectangle at (147, 106) with width 71 and height 14.
; PLAN: r0=483(x1), r1=137(y1), r2=340(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=475(x), r6=159(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=147(x), r11=106(y), r12=71(width), r13=14(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 483
LDI r1, 137
LDI r2, 340
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 159
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 147
LDI r11, 106
LDI r12, 71
LDI r13, 14
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
