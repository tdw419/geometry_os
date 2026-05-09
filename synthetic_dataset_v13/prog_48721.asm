; DESCRIPTION: Composite: Renders a orange disk with center (431, 226) and radius 25 then Renders a purple line between points (348, 122) and (442, 186) then Draws a red rectangle at (375, 34) with width 96 and height 116.
; PLAN: r0=431(x), r1=226(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=122(y1), r7=442(x2), r8=186(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=375(x), r11=34(y), r12=96(width), r13=116(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 226
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 122
LDI r7, 442
LDI r8, 186
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 34
LDI r12, 96
LDI r13, 116
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
