; DESCRIPTION: Composite: Places a green dot at position (325, 80) then Creates a magenta rectangular region at (191, 160) spanning 26 by 34 pixels then Draws a purple line from (458, 36) to (91, 9).
; PLAN: r0=325(x), r1=80(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=160(y), r7=26(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=458(x1), r11=36(y1), r12=91(x2), r13=9(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 80
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 191
LDI r6, 160
LDI r7, 26
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 36
LDI r12, 91
LDI r13, 9
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
