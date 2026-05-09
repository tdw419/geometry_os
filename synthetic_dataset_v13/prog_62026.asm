; DESCRIPTION: Composite: Renders a black disk with center (315, 108) and radius 79 then Draws a white rectangle at (165, 122) with width 64 and height 89 then Draws a purple line from (400, 61) to (67, 72).
; PLAN: r0=315(x), r1=108(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=122(y), r7=64(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=400(x1), r11=61(y1), r12=67(x2), r13=72(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 108
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 122
LDI r7, 64
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 61
LDI r12, 67
LDI r13, 72
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
