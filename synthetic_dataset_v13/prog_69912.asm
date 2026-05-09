; DESCRIPTION: Composite: Places a red line segment connecting (14, 251) to (105, 53) then Renders a magenta box of size 74x115 starting at (38, 26) then Draws a purple circle centered at (122, 175) with radius 79.
; PLAN: r0=14(x1), r1=251(y1), r2=105(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=26(y), r7=74(width), r8=115(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x), r11=175(y), r12=79(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 14
LDI r1, 251
LDI r2, 105
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 26
LDI r7, 74
LDI r8, 115
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 175
LDI r12, 79
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
