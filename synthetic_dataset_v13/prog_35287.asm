; DESCRIPTION: Composite: Places a orange dot at position (312, 202) then Draws a orange line from (107, 167) to (362, 153) then Creates a black circular shape at (304, 56) with radius 53.
; PLAN: r0=312(x), r1=202(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=107(x1), r6=167(y1), r7=362(x2), r8=153(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=304(x), r11=56(y), r12=53(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 202
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 107
LDI r6, 167
LDI r7, 362
LDI r8, 153
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 56
LDI r12, 53
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
