; DESCRIPTION: Composite: Places a purple dot at position (457, 7) then Creates a red rectangular region at (19, 73) spanning 18 by 85 pixels then Draws a yellow line from (406, 160) to (166, 41).
; PLAN: r0=457(x), r1=7(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=73(y), r7=18(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=406(x1), r11=160(y1), r12=166(x2), r13=41(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 7
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 73
LDI r7, 18
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 160
LDI r12, 166
LDI r13, 41
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
