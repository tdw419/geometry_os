; DESCRIPTION: Composite: Draws a magenta rectangle at (350, 186) with width 46 and height 13 then Draws a blue line from (64, 133) to (471, 246) then Renders a blue disk with center (123, 174) and radius 18.
; PLAN: r0=350(x), r1=186(y), r2=46(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x1), r6=133(y1), r7=471(x2), r8=246(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=174(y), r12=18(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 350
LDI r1, 186
LDI r2, 46
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 133
LDI r7, 471
LDI r8, 246
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 174
LDI r12, 18
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
