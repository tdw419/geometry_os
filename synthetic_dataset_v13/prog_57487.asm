; DESCRIPTION: Composite: Places a orange dot at position (312, 181) then Draws a red line from (164, 1) to (364, 73) then Creates a blue circular shape at (241, 142) with radius 73.
; PLAN: r0=312(x), r1=181(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=164(x1), r6=1(y1), r7=364(x2), r8=73(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=241(x), r11=142(y), r12=73(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 181
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 164
LDI r6, 1
LDI r7, 364
LDI r8, 73
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 142
LDI r12, 73
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
