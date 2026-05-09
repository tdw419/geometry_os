; DESCRIPTION: Composite: Creates a red circular shape at (395, 136) with radius 63 then Draws a purple line from (339, 141) to (203, 238) then Creates a white rectangular region at (199, 13) spanning 65 by 120 pixels.
; PLAN: r0=395(x), r1=136(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x1), r6=141(y1), r7=203(x2), r8=238(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=199(x), r11=13(y), r12=65(width), r13=120(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 136
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 141
LDI r7, 203
LDI r8, 238
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 13
LDI r12, 65
LDI r13, 120
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
