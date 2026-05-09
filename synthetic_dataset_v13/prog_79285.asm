; DESCRIPTION: Composite: Draws a black line from (133, 220) to (348, 199) then Creates a green rectangular region at (278, 89) spanning 67 by 19 pixels then Renders a yellow disk with center (441, 66) and radius 66.
; PLAN: r0=133(x1), r1=220(y1), r2=348(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=89(y), r7=67(width), r8=19(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=66(y), r12=66(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 220
LDI r2, 348
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 89
LDI r7, 67
LDI r8, 19
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 66
LDI r12, 66
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
