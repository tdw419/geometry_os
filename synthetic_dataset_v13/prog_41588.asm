; DESCRIPTION: Composite: Draws a purple line from (209, 244) to (222, 36) then Draws a blue rectangle at (137, 33) with width 45 and height 62 then Sets a single black pixel at (145, 22).
; PLAN: r0=209(x1), r1=244(y1), r2=222(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=33(y), r7=45(width), r8=62(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=145(x), r11=22(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 209
LDI r1, 244
LDI r2, 222
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 33
LDI r7, 45
LDI r8, 62
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 22
LDI r12, 0x000000
PSET r10, r11, r12
HALT
