; DESCRIPTION: Composite: Draws a red line from (131, 41) to (123, 61) then Sets a single yellow pixel at (307, 25) then Creates a black rectangular region at (141, 77) spanning 105 by 36 pixels.
; PLAN: r0=131(x1), r1=41(y1), r2=123(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=25(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=77(y), r12=105(width), r13=36(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 41
LDI r2, 123
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 25
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 141
LDI r11, 77
LDI r12, 105
LDI r13, 36
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
