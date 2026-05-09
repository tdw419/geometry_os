; DESCRIPTION: Composite: Creates a orange rectangular region at (461, 104) spanning 13 by 88 pixels then Renders a purple line between points (85, 155) and (488, 164) then Draws a white circle centered at (80, 147) with radius 48.
; PLAN: r0=461(x), r1=104(y), r2=13(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x1), r6=155(y1), r7=488(x2), r8=164(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=80(x), r11=147(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 461
LDI r1, 104
LDI r2, 13
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 155
LDI r7, 488
LDI r8, 164
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 147
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
