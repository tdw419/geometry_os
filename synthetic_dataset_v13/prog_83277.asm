; DESCRIPTION: Composite: Places a purple dot at position (170, 138) then Renders a black line between points (344, 13) and (37, 92) then Draws a red rectangle at (156, 158) with width 24 and height 39.
; PLAN: r0=170(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=344(x1), r6=13(y1), r7=37(x2), r8=92(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=158(y), r12=24(width), r13=39(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 138
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 13
LDI r7, 37
LDI r8, 92
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 158
LDI r12, 24
LDI r13, 39
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
