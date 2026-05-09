; DESCRIPTION: Composite: Places a purple circle of radius 75 at center (179, 173) then Draws a blue rectangle at (427, 53) with width 59 and height 98 then Renders a red line between points (123, 195) and (408, 198).
; PLAN: r0=179(x), r1=173(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x), r6=53(y), r7=59(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x1), r11=195(y1), r12=408(x2), r13=198(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 173
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 53
LDI r7, 59
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 195
LDI r12, 408
LDI r13, 198
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
