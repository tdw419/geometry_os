; DESCRIPTION: Composite: Draws a cyan line from (94, 230) to (325, 216) then Places a orange 112x30 rectangle at position (4, 209) then Draws a purple circle centered at (220, 181) with radius 41.
; PLAN: r0=94(x1), r1=230(y1), r2=325(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=4(x), r6=209(y), r7=112(width), r8=30(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=220(x), r11=181(y), r12=41(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 230
LDI r2, 325
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 209
LDI r7, 112
LDI r8, 30
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 181
LDI r12, 41
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
