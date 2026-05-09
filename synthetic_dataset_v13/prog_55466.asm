; DESCRIPTION: Composite: Draws a magenta rectangle at (318, 62) with width 62 and height 46 then Draws a red line from (336, 103) to (462, 97) then Renders a black disk with center (220, 80) and radius 77.
; PLAN: r0=318(x), r1=62(y), r2=62(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x1), r6=103(y1), r7=462(x2), r8=97(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=220(x), r11=80(y), r12=77(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 318
LDI r1, 62
LDI r2, 62
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 103
LDI r7, 462
LDI r8, 97
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 80
LDI r12, 77
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
