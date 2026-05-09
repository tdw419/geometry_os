; DESCRIPTION: Composite: Sets a single yellow pixel at (55, 49) then Creates a black rectangular region at (78, 48) spanning 114 by 95 pixels then Draws a magenta line from (398, 151) to (339, 130).
; PLAN: r0=55(x), r1=49(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=48(y), r7=114(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=398(x1), r11=151(y1), r12=339(x2), r13=130(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 49
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 78
LDI r6, 48
LDI r7, 114
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 151
LDI r12, 339
LDI r13, 130
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
