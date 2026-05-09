; DESCRIPTION: Composite: Places a purple line segment connecting (89, 187) to (381, 132) then Sets a single purple pixel at (331, 33) then Creates a orange rectangular region at (181, 155) spanning 30 by 48 pixels.
; PLAN: r0=89(x1), r1=187(y1), r2=381(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=33(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=181(x), r11=155(y), r12=30(width), r13=48(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 187
LDI r2, 381
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 33
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 181
LDI r11, 155
LDI r12, 30
LDI r13, 48
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
