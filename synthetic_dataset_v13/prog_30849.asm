; DESCRIPTION: Composite: Places a orange line segment connecting (248, 110) to (153, 157) then Draws a cyan rectangle at (246, 173) with width 21 and height 28 then Renders a magenta disk with center (312, 127) and radius 54.
; PLAN: r0=248(x1), r1=110(y1), r2=153(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=173(y), r7=21(width), r8=28(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x), r11=127(y), r12=54(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 110
LDI r2, 153
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 173
LDI r7, 21
LDI r8, 28
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 127
LDI r12, 54
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
