; DESCRIPTION: Composite: Places a purple dot at position (213, 37) then Creates a black rectangular region at (334, 99) spanning 104 by 38 pixels then Draws a orange line from (139, 112) to (491, 202).
; PLAN: r0=213(x), r1=37(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=99(y), r7=104(width), r8=38(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=139(x1), r11=112(y1), r12=491(x2), r13=202(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 37
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 334
LDI r6, 99
LDI r7, 104
LDI r8, 38
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 112
LDI r12, 491
LDI r13, 202
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
