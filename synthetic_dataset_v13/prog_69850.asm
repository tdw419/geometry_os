; DESCRIPTION: Composite: Draws a magenta rectangle at (313, 124) with width 75 and height 65 then Renders a red disk with center (70, 143) and radius 55 then Places a orange line segment connecting (488, 200) to (231, 183).
; PLAN: r0=313(x), r1=124(y), r2=75(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x), r6=143(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=488(x1), r11=200(y1), r12=231(x2), r13=183(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 124
LDI r2, 75
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 143
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 488
LDI r11, 200
LDI r12, 231
LDI r13, 183
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
