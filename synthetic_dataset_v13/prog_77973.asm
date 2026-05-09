; DESCRIPTION: Composite: Places a black line segment connecting (348, 254) to (63, 41) then Sets a single blue pixel at (411, 86) then Creates a green rectangular region at (26, 3) spanning 43 by 75 pixels.
; PLAN: r0=348(x1), r1=254(y1), r2=63(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=86(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=26(x), r11=3(y), r12=43(width), r13=75(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 254
LDI r2, 63
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 86
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 26
LDI r11, 3
LDI r12, 43
LDI r13, 75
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
