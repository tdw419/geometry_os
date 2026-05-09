; DESCRIPTION: Composite: Places a purple line segment connecting (104, 169) to (327, 123) then Draws a magenta rectangle at (345, 209) with width 65 and height 20 then Renders a black disk with center (420, 174) and radius 14.
; PLAN: r0=104(x1), r1=169(y1), r2=327(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=209(y), r7=65(width), r8=20(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=420(x), r11=174(y), r12=14(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 104
LDI r1, 169
LDI r2, 327
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 209
LDI r7, 65
LDI r8, 20
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 174
LDI r12, 14
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
