; DESCRIPTION: Composite: Renders a black line between points (369, 155) and (239, 48) then Sets a single green pixel at (484, 55) then Creates a blue rectangular region at (7, 161) spanning 104 by 65 pixels.
; PLAN: r0=369(x1), r1=155(y1), r2=239(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=55(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=7(x), r11=161(y), r12=104(width), r13=65(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 155
LDI r2, 239
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 55
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 7
LDI r11, 161
LDI r12, 104
LDI r13, 65
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
