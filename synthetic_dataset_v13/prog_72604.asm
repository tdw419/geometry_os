; DESCRIPTION: Composite: Creates a green rectangular region at (431, 169) spanning 52 by 16 pixels then Sets a single blue pixel at (242, 192) then Draws a orange line from (486, 234) to (348, 11).
; PLAN: r0=431(x), r1=169(y), r2=52(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=192(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=486(x1), r11=234(y1), r12=348(x2), r13=11(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 169
LDI r2, 52
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 192
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 486
LDI r11, 234
LDI r12, 348
LDI r13, 11
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
