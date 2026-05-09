; DESCRIPTION: Composite: Draws a yellow line from (137, 212) to (370, 115) then Sets a single black pixel at (361, 41) then Creates a black rectangular region at (188, 46) spanning 110 by 72 pixels.
; PLAN: r0=137(x1), r1=212(y1), r2=370(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=41(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=188(x), r11=46(y), r12=110(width), r13=72(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 212
LDI r2, 370
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 41
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 188
LDI r11, 46
LDI r12, 110
LDI r13, 72
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
