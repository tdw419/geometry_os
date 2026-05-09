; DESCRIPTION: Composite: Creates a red rectangular region at (99, 59) spanning 11 by 102 pixels then Sets a single blue pixel at (47, 110) then Draws a cyan line from (56, 241) to (316, 106).
; PLAN: r0=99(x), r1=59(y), r2=11(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x), r6=110(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=56(x1), r11=241(y1), r12=316(x2), r13=106(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 59
LDI r2, 11
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 110
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 56
LDI r11, 241
LDI r12, 316
LDI r13, 106
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
