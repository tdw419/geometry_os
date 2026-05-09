; DESCRIPTION: Composite: Places a black dot at position (101, 4) then Creates a yellow rectangular region at (51, 83) spanning 51 by 115 pixels then Draws a orange line from (296, 34) to (356, 229).
; PLAN: r0=101(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=51(x), r6=83(y), r7=51(width), r8=115(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x1), r11=34(y1), r12=356(x2), r13=229(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 4
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 51
LDI r6, 83
LDI r7, 51
LDI r8, 115
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 34
LDI r12, 356
LDI r13, 229
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
