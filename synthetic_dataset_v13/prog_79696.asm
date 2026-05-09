; DESCRIPTION: Composite: Creates a black rectangular region at (344, 20) spanning 67 by 49 pixels then Places a yellow dot at position (268, 133) then Draws a white line from (47, 167) to (301, 51).
; PLAN: r0=344(x), r1=20(y), r2=67(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=133(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=47(x1), r11=167(y1), r12=301(x2), r13=51(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 20
LDI r2, 67
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 133
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 47
LDI r11, 167
LDI r12, 301
LDI r13, 51
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
