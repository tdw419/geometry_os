; DESCRIPTION: Composite: Renders a red line between points (500, 234) and (174, 198) then Sets a single yellow pixel at (54, 235) then Creates a purple rectangular region at (99, 145) spanning 49 by 64 pixels.
; PLAN: r0=500(x1), r1=234(y1), r2=174(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=235(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=99(x), r11=145(y), r12=49(width), r13=64(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 234
LDI r2, 174
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 235
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 99
LDI r11, 145
LDI r12, 49
LDI r13, 64
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
