; DESCRIPTION: Composite: Places a purple line segment connecting (66, 184) to (143, 12) then Draws a black rectangle at (22, 169) with width 85 and height 43 then Renders a yellow disk with center (42, 223) and radius 25.
; PLAN: r0=66(x1), r1=184(y1), r2=143(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=169(y), r7=85(width), r8=43(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=42(x), r11=223(y), r12=25(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 184
LDI r2, 143
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 169
LDI r7, 85
LDI r8, 43
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 223
LDI r12, 25
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
