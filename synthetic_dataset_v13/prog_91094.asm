; DESCRIPTION: Composite: Creates a white rectangular region at (252, 98) spanning 35 by 21 pixels then Renders a white disk with center (472, 58) and radius 14 then Draws a white line from (315, 30) to (35, 202).
; PLAN: r0=252(x), r1=98(y), r2=35(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x), r6=58(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x1), r11=30(y1), r12=35(x2), r13=202(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 98
LDI r2, 35
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 58
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 30
LDI r12, 35
LDI r13, 202
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
