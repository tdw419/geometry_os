; DESCRIPTION: Composite: Creates a yellow rectangular region at (228, 71) spanning 29 by 28 pixels then Draws a blue line from (274, 95) to (332, 105) then Draws a blue circle centered at (179, 78) with radius 15.
; PLAN: r0=228(x), r1=71(y), r2=29(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x1), r6=95(y1), r7=332(x2), r8=105(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=78(y), r12=15(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 228
LDI r1, 71
LDI r2, 29
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 95
LDI r7, 332
LDI r8, 105
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 78
LDI r12, 15
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
