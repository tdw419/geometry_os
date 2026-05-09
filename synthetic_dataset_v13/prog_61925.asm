; DESCRIPTION: Composite: Draws a yellow line from (49, 80) to (318, 127) then Sets a single black pixel at (94, 11) then Draws a blue rectangle at (289, 22) with width 19 and height 83.
; PLAN: r0=49(x1), r1=80(y1), r2=318(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=11(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=289(x), r11=22(y), r12=19(width), r13=83(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 80
LDI r2, 318
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 11
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 289
LDI r11, 22
LDI r12, 19
LDI r13, 83
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
