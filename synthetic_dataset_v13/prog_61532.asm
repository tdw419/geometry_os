; DESCRIPTION: Composite: Draws a yellow rectangle at (29, 165) with width 54 and height 74 then Sets a single blue pixel at (68, 199) then Places a blue line segment connecting (339, 36) to (158, 198).
; PLAN: r0=29(x), r1=165(y), r2=54(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=199(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=339(x1), r11=36(y1), r12=158(x2), r13=198(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 165
LDI r2, 54
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 199
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 339
LDI r11, 36
LDI r12, 158
LDI r13, 198
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
