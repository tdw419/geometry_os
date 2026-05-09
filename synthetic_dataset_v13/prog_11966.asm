; DESCRIPTION: Composite: Draws a black line from (101, 113) to (391, 84) then Creates a orange rectangular region at (336, 182) spanning 111 by 61 pixels then Creates a red circular shape at (179, 171) with radius 26.
; PLAN: r0=101(x1), r1=113(y1), r2=391(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=182(y), r7=111(width), r8=61(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x), r11=171(y), r12=26(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 101
LDI r1, 113
LDI r2, 391
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 182
LDI r7, 111
LDI r8, 61
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 171
LDI r12, 26
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
