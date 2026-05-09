; DESCRIPTION: Composite: Draws a red circle centered at (21, 185) with radius 18 then Creates a green rectangular region at (435, 49) spanning 44 by 56 pixels then Renders a orange line between points (148, 217) and (393, 51).
; PLAN: r0=21(x), r1=185(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=49(y), r7=44(width), r8=56(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=148(x1), r11=217(y1), r12=393(x2), r13=51(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 21
LDI r1, 185
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 49
LDI r7, 44
LDI r8, 56
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 217
LDI r12, 393
LDI r13, 51
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
