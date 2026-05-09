; DESCRIPTION: Composite: Draws a orange line from (248, 22) to (168, 72) then Creates a purple rectangular region at (97, 217) spanning 86 by 17 pixels then Places a purple dot at position (415, 224).
; PLAN: r0=248(x1), r1=22(y1), r2=168(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=217(y), r7=86(width), r8=17(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=415(x), r11=224(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 22
LDI r2, 168
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 217
LDI r7, 86
LDI r8, 17
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 224
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
