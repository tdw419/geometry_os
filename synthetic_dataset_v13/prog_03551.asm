; DESCRIPTION: Composite: Sets a single red pixel at (466, 35) then Draws a yellow rectangle at (251, 78) with width 110 and height 17 then Places a black line segment connecting (310, 155) to (147, 87).
; PLAN: r0=466(x), r1=35(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=78(y), r7=110(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=310(x1), r11=155(y1), r12=147(x2), r13=87(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 35
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 251
LDI r6, 78
LDI r7, 110
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 155
LDI r12, 147
LDI r13, 87
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
