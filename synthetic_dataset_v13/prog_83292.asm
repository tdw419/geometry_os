; DESCRIPTION: Composite: Draws a purple line from (106, 81) to (248, 238) then Draws a blue rectangle at (233, 89) with width 58 and height 38 then Draws a green circle centered at (149, 229) with radius 12.
; PLAN: r0=106(x1), r1=81(y1), r2=248(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=89(y), r7=58(width), r8=38(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x), r11=229(y), r12=12(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 106
LDI r1, 81
LDI r2, 248
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 89
LDI r7, 58
LDI r8, 38
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 229
LDI r12, 12
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
