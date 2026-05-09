; DESCRIPTION: Composite: Draws a purple rectangle at (121, 147) with width 110 and height 90 then Sets a single orange pixel at (507, 81) then Draws a blue line from (378, 40) to (70, 17).
; PLAN: r0=121(x), r1=147(y), r2=110(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x), r6=81(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=378(x1), r11=40(y1), r12=70(x2), r13=17(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 147
LDI r2, 110
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 81
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 378
LDI r11, 40
LDI r12, 70
LDI r13, 17
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
