; DESCRIPTION: Composite: Draws a yellow rectangle at (430, 58) with width 14 and height 109 then Places a purple line segment connecting (281, 229) to (455, 128) then Places a green circle of radius 73 at center (418, 169).
; PLAN: r0=430(x), r1=58(y), r2=14(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x1), r6=229(y1), r7=455(x2), r8=128(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=418(x), r11=169(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 58
LDI r2, 14
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 229
LDI r7, 455
LDI r8, 128
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 169
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
