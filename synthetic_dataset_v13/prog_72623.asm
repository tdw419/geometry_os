; DESCRIPTION: Composite: Creates a black circular shape at (108, 174) with radius 50 then Creates a green rectangular region at (245, 20) spanning 61 by 56 pixels then Draws a black line from (411, 182) to (148, 95).
; PLAN: r0=108(x), r1=174(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x), r6=20(y), r7=61(width), r8=56(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=411(x1), r11=182(y1), r12=148(x2), r13=95(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 174
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 20
LDI r7, 61
LDI r8, 56
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 182
LDI r12, 148
LDI r13, 95
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
