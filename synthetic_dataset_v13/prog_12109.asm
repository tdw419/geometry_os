; DESCRIPTION: Composite: Creates a black rectangular region at (272, 104) spanning 26 by 91 pixels then Draws a purple line from (105, 124) to (430, 217).
; PLAN: r0=272(x), r1=104(y), r2=26(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x1), r6=124(y1), r7=430(x2), r8=217(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 104
LDI r2, 26
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 124
LDI r7, 430
LDI r8, 217
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
