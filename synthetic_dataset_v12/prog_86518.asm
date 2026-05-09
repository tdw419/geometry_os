; DESCRIPTION: Composite: Places a black dot at position (385, 83) then Creates a blue rectangular region at (77, 109) spanning 37 by 105 pixels then Places a purple line segment connecting (370, 252) to (501, 97).
; PLAN: r0=385(x), r1=83(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=109(y), r7=37(width), r8=105(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x1), r11=252(y1), r12=501(x2), r13=97(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 83
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 77
LDI r6, 109
LDI r7, 37
LDI r8, 105
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 252
LDI r12, 501
LDI r13, 97
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
