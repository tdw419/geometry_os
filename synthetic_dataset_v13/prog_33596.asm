; DESCRIPTION: Composite: Draws a orange line from (495, 223) to (229, 161) then Sets a single red pixel at (19, 154) then Creates a yellow rectangular region at (360, 112) spanning 68 by 86 pixels.
; PLAN: r0=495(x1), r1=223(y1), r2=229(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=154(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=360(x), r11=112(y), r12=68(width), r13=86(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 223
LDI r2, 229
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 154
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 360
LDI r11, 112
LDI r12, 68
LDI r13, 86
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
