; DESCRIPTION: Composite: Creates a purple rectangular region at (362, 73) spanning 102 by 45 pixels then Draws a purple line from (406, 207) to (73, 21) then Creates a green circular shape at (369, 95) with radius 79.
; PLAN: r0=362(x), r1=73(y), r2=102(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x1), r6=207(y1), r7=73(x2), r8=21(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=95(y), r12=79(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 73
LDI r2, 102
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 207
LDI r7, 73
LDI r8, 21
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 95
LDI r12, 79
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
