; DESCRIPTION: Composite: Renders a red box of size 62x46 starting at (84, 208) then Places a green circle of radius 68 at center (106, 185) then Draws a red line from (158, 162) to (385, 172).
; PLAN: r0=84(x), r1=208(y), r2=62(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=185(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x1), r11=162(y1), r12=385(x2), r13=172(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 208
LDI r2, 62
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 185
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 162
LDI r12, 385
LDI r13, 172
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
