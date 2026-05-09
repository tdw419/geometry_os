; DESCRIPTION: Composite: Places a red dot at position (432, 22) then Draws a purple line from (407, 2) to (79, 200) then Draws a black rectangle at (301, 35) with width 67 and height 53.
; PLAN: r0=432(x), r1=22(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=407(x1), r6=2(y1), r7=79(x2), r8=200(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=35(y), r12=67(width), r13=53(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 22
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 407
LDI r6, 2
LDI r7, 79
LDI r8, 200
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 35
LDI r12, 67
LDI r13, 53
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
