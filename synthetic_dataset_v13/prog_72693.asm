; DESCRIPTION: Composite: Renders a blue box of size 45x16 starting at (139, 34) then Draws a blue line from (152, 21) to (278, 5) then Draws a blue circle centered at (96, 106) with radius 62.
; PLAN: r0=139(x), r1=34(y), r2=45(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x1), r6=21(y1), r7=278(x2), r8=5(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=106(y), r12=62(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 139
LDI r1, 34
LDI r2, 45
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 21
LDI r7, 278
LDI r8, 5
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 106
LDI r12, 62
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
