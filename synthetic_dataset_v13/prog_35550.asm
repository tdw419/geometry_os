; DESCRIPTION: Composite: Creates a green rectangular region at (118, 118) spanning 58 by 74 pixels then Places a black line segment connecting (125, 88) to (324, 190) then Draws a purple circle centered at (360, 148) with radius 60.
; PLAN: r0=118(x), r1=118(y), r2=58(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x1), r6=88(y1), r7=324(x2), r8=190(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=148(y), r12=60(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 118
LDI r1, 118
LDI r2, 58
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 88
LDI r7, 324
LDI r8, 190
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 148
LDI r12, 60
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
