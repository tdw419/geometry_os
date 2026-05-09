; DESCRIPTION: Composite: Creates a orange rectangular region at (190, 114) spanning 109 by 117 pixels then Places a black dot at position (344, 222) then Draws a purple line from (374, 101) to (306, 156).
; PLAN: r0=190(x), r1=114(y), r2=109(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=222(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=374(x1), r11=101(y1), r12=306(x2), r13=156(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 114
LDI r2, 109
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 222
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 374
LDI r11, 101
LDI r12, 306
LDI r13, 156
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
