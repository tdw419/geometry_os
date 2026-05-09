; DESCRIPTION: Composite: Creates a purple rectangular region at (168, 18) spanning 69 by 63 pixels then Draws a black line from (158, 166) to (266, 153) then Renders a blue disk with center (427, 121) and radius 50.
; PLAN: r0=168(x), r1=18(y), r2=69(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x1), r6=166(y1), r7=266(x2), r8=153(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=427(x), r11=121(y), r12=50(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 168
LDI r1, 18
LDI r2, 69
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 166
LDI r7, 266
LDI r8, 153
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 121
LDI r12, 50
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
