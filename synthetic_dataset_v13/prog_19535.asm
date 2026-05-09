; DESCRIPTION: Composite: Places a red line segment connecting (306, 76) to (223, 217) then Renders a blue disk with center (373, 168) and radius 75 then Draws a black rectangle at (433, 81) with width 73 and height 78.
; PLAN: r0=306(x1), r1=76(y1), r2=223(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=168(y), r7=75(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=433(x), r11=81(y), r12=73(width), r13=78(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 76
LDI r2, 223
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 168
LDI r7, 75
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 433
LDI r11, 81
LDI r12, 73
LDI r13, 78
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
