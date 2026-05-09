; DESCRIPTION: Composite: Sets a single yellow pixel at (145, 131) then Draws a blue circle centered at (301, 179) with radius 71 then Draws a purple line from (344, 68) to (123, 22).
; PLAN: r0=145(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=179(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=344(x1), r11=68(y1), r12=123(x2), r13=22(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 131
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 301
LDI r6, 179
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 344
LDI r11, 68
LDI r12, 123
LDI r13, 22
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
