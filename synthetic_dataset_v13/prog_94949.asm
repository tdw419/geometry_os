; DESCRIPTION: Composite: Draws a blue line from (249, 137) to (34, 118) then Draws a yellow rectangle at (147, 122) with width 106 and height 16 then Places a white circle of radius 32 at center (197, 38).
; PLAN: r0=249(x1), r1=137(y1), r2=34(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=122(y), r7=106(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=197(x), r11=38(y), r12=32(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 137
LDI r2, 34
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 122
LDI r7, 106
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 38
LDI r12, 32
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
