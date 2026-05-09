; DESCRIPTION: Composite: Draws a yellow rectangle at (248, 58) with width 107 and height 52 then Renders a yellow line between points (141, 121) and (269, 246) then Places a green circle of radius 72 at center (229, 105).
; PLAN: r0=248(x), r1=58(y), r2=107(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x1), r6=121(y1), r7=269(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=105(y), r12=72(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 58
LDI r2, 107
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 121
LDI r7, 269
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 105
LDI r12, 72
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
