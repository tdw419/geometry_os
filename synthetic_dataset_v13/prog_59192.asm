; DESCRIPTION: Composite: Draws a purple line from (270, 115) to (174, 160) then Sets a single blue pixel at (179, 70) then Draws a orange rectangle at (171, 65) with width 10 and height 109.
; PLAN: r0=270(x1), r1=115(y1), r2=174(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=70(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=171(x), r11=65(y), r12=10(width), r13=109(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 115
LDI r2, 174
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 70
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 171
LDI r11, 65
LDI r12, 10
LDI r13, 109
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
