; DESCRIPTION: Composite: Renders a black line between points (176, 240) and (116, 50) then Creates a magenta rectangular region at (134, 187) spanning 41 by 30 pixels then Draws a red circle centered at (375, 171) with radius 53.
; PLAN: r0=176(x1), r1=240(y1), r2=116(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=187(y), r7=41(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x), r11=171(y), r12=53(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 176
LDI r1, 240
LDI r2, 116
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 187
LDI r7, 41
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 171
LDI r12, 53
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
