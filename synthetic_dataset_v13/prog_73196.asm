; DESCRIPTION: Composite: Draws a purple rectangle at (36, 156) with width 51 and height 95 then Sets a single green pixel at (181, 154) then Renders a blue line between points (89, 91) and (427, 251).
; PLAN: r0=36(x), r1=156(y), r2=51(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x), r6=154(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=89(x1), r11=91(y1), r12=427(x2), r13=251(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 156
LDI r2, 51
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 154
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 89
LDI r11, 91
LDI r12, 427
LDI r13, 251
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
