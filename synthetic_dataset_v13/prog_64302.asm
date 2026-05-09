; DESCRIPTION: Composite: Places a white dot at position (368, 192) then Creates a yellow rectangular region at (136, 49) spanning 23 by 48 pixels then Draws a red line from (9, 41) to (165, 168).
; PLAN: r0=368(x), r1=192(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=49(y), r7=23(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=9(x1), r11=41(y1), r12=165(x2), r13=168(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 192
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 136
LDI r6, 49
LDI r7, 23
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 9
LDI r11, 41
LDI r12, 165
LDI r13, 168
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
