; DESCRIPTION: Composite: Places a red dot at position (142, 146) then Draws a purple line from (125, 162) to (312, 68) then Draws a black rectangle at (371, 168) with width 110 and height 29.
; PLAN: r0=142(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=125(x1), r6=162(y1), r7=312(x2), r8=68(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=168(y), r12=110(width), r13=29(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 146
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 125
LDI r6, 162
LDI r7, 312
LDI r8, 68
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 168
LDI r12, 110
LDI r13, 29
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
