; DESCRIPTION: Composite: Creates a blue rectangular region at (120, 3) spanning 35 by 79 pixels then Sets a single red pixel at (169, 40) then Draws a red line from (314, 157) to (398, 181).
; PLAN: r0=120(x), r1=3(y), r2=35(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x), r6=40(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=314(x1), r11=157(y1), r12=398(x2), r13=181(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 3
LDI r2, 35
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 40
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 314
LDI r11, 157
LDI r12, 398
LDI r13, 181
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
