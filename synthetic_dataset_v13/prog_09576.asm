; DESCRIPTION: Composite: Places a black dot at position (434, 232) then Draws a purple line from (427, 230) to (299, 75) then Creates a magenta rectangular region at (99, 106) spanning 99 by 31 pixels.
; PLAN: r0=434(x), r1=232(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=427(x1), r6=230(y1), r7=299(x2), r8=75(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=106(y), r12=99(width), r13=31(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 232
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 427
LDI r6, 230
LDI r7, 299
LDI r8, 75
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 106
LDI r12, 99
LDI r13, 31
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
