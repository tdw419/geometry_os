; DESCRIPTION: Composite: Draws a yellow rectangle at (155, 18) with width 73 and height 106 then Places a yellow line segment connecting (259, 121) to (228, 96) then Renders a green disk with center (203, 84) and radius 54.
; PLAN: r0=155(x), r1=18(y), r2=73(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x1), r6=121(y1), r7=228(x2), r8=96(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=203(x), r11=84(y), r12=54(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 155
LDI r1, 18
LDI r2, 73
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 121
LDI r7, 228
LDI r8, 96
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 84
LDI r12, 54
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
