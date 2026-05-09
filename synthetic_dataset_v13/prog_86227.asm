; DESCRIPTION: Composite: Renders a purple line between points (278, 220) and (211, 121) then Creates a blue rectangular region at (318, 0) spanning 105 by 112 pixels then Renders a magenta disk with center (288, 77) and radius 57.
; PLAN: r0=278(x1), r1=220(y1), r2=211(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=0(y), r7=105(width), r8=112(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=288(x), r11=77(y), r12=57(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 220
LDI r2, 211
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 0
LDI r7, 105
LDI r8, 112
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 77
LDI r12, 57
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
