; DESCRIPTION: Composite: Draws a green rectangle at (31, 153) with width 118 and height 44 then Places a red line segment connecting (384, 35) to (458, 95) then Draws a black circle centered at (438, 174) with radius 65.
; PLAN: r0=31(x), r1=153(y), r2=118(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x1), r6=35(y1), r7=458(x2), r8=95(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=438(x), r11=174(y), r12=65(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 153
LDI r2, 118
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 35
LDI r7, 458
LDI r8, 95
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 174
LDI r12, 65
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
