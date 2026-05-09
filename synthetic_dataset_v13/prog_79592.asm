; DESCRIPTION: Composite: Draws a blue line from (128, 251) to (374, 7) then Draws a purple rectangle at (49, 94) with width 101 and height 94 then Creates a white circular shape at (193, 188) with radius 25.
; PLAN: r0=128(x1), r1=251(y1), r2=374(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=94(y), r7=101(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x), r11=188(y), r12=25(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 128
LDI r1, 251
LDI r2, 374
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 94
LDI r7, 101
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 188
LDI r12, 25
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
