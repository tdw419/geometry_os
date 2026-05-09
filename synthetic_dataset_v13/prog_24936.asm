; DESCRIPTION: Composite: Sets a single black pixel at (121, 7) then Creates a magenta rectangular region at (447, 23) spanning 48 by 115 pixels then Draws a magenta line from (457, 175) to (390, 95).
; PLAN: r0=121(x), r1=7(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=23(y), r7=48(width), r8=115(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=457(x1), r11=175(y1), r12=390(x2), r13=95(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 7
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 447
LDI r6, 23
LDI r7, 48
LDI r8, 115
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 175
LDI r12, 390
LDI r13, 95
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
