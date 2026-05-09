; DESCRIPTION: Composite: Draws a purple circle centered at (55, 114) with radius 34 then Renders a purple line between points (427, 90) and (137, 136) then Sets a single black pixel at (398, 188).
; PLAN: r0=55(x), r1=114(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x1), r6=90(y1), r7=137(x2), r8=136(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=398(x), r11=188(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 55
LDI r1, 114
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 90
LDI r7, 137
LDI r8, 136
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 188
LDI r12, 0x000000
PSET r10, r11, r12
HALT
