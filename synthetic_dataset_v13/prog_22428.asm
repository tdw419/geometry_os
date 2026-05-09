; DESCRIPTION: Composite: Draws a purple rectangle at (450, 136) with width 22 and height 89 then Places a red line segment connecting (70, 169) to (8, 45) then Sets a single black pixel at (195, 104).
; PLAN: r0=450(x), r1=136(y), r2=22(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x1), r6=169(y1), r7=8(x2), r8=45(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=195(x), r11=104(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 136
LDI r2, 22
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 169
LDI r7, 8
LDI r8, 45
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 104
LDI r12, 0x000000
PSET r10, r11, r12
HALT
