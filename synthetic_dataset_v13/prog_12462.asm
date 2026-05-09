; DESCRIPTION: Composite: Places a blue circle of radius 75 at center (322, 94) then Creates a red rectangular region at (246, 60) spanning 102 by 43 pixels then Draws a black line from (329, 76) to (271, 41).
; PLAN: r0=322(x), r1=94(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=60(y), r7=102(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x1), r11=76(y1), r12=271(x2), r13=41(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 94
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 60
LDI r7, 102
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 76
LDI r12, 271
LDI r13, 41
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
