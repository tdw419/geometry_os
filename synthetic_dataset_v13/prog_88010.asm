; DESCRIPTION: Composite: Renders a purple line between points (148, 203) and (31, 126) then Creates a red circular shape at (178, 217) with radius 34 then Draws a red rectangle at (97, 59) with width 76 and height 69.
; PLAN: r0=148(x1), r1=203(y1), r2=31(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=217(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x), r11=59(y), r12=76(width), r13=69(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 203
LDI r2, 31
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 217
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 59
LDI r12, 76
LDI r13, 69
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
