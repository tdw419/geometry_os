; DESCRIPTION: Composite: Places a white dot at position (353, 250) then Creates a black rectangular region at (252, 42) spanning 41 by 74 pixels then Draws a purple line from (263, 99) to (398, 62).
; PLAN: r0=353(x), r1=250(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=42(y), r7=41(width), r8=74(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=263(x1), r11=99(y1), r12=398(x2), r13=62(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 250
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 42
LDI r7, 41
LDI r8, 74
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 99
LDI r12, 398
LDI r13, 62
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
