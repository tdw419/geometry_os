; DESCRIPTION: Composite: Draws a black circle centered at (134, 138) with radius 80 then Renders a red line between points (157, 188) and (160, 40) then Creates a black rectangular region at (159, 158) spanning 74 by 67 pixels.
; PLAN: r0=134(x), r1=138(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x1), r6=188(y1), r7=160(x2), r8=40(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=158(y), r12=74(width), r13=67(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 138
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 188
LDI r7, 160
LDI r8, 40
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 158
LDI r12, 74
LDI r13, 67
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
