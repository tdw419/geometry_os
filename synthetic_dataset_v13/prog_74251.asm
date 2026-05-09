; DESCRIPTION: Composite: Draws a white line from (254, 203) to (185, 203) then Sets a single yellow pixel at (303, 119) then Creates a blue rectangular region at (141, 122) spanning 90 by 112 pixels.
; PLAN: r0=254(x1), r1=203(y1), r2=185(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=119(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=122(y), r12=90(width), r13=112(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 203
LDI r2, 185
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 119
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 141
LDI r11, 122
LDI r12, 90
LDI r13, 112
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
