; DESCRIPTION: Composite: Draws a purple rectangle at (233, 143) with width 54 and height 38 then Places a purple line segment connecting (240, 211) to (359, 189) then Draws a magenta circle centered at (105, 162) with radius 34.
; PLAN: r0=233(x), r1=143(y), r2=54(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x1), r6=211(y1), r7=359(x2), r8=189(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=162(y), r12=34(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 143
LDI r2, 54
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 211
LDI r7, 359
LDI r8, 189
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 162
LDI r12, 34
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
