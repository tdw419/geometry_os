; DESCRIPTION: Composite: Draws a cyan line from (111, 26) to (370, 191) then Creates a magenta rectangular region at (236, 159) spanning 76 by 72 pixels then Draws a orange circle centered at (270, 158) with radius 80.
; PLAN: r0=111(x1), r1=26(y1), r2=370(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=159(y), r7=76(width), r8=72(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x), r11=158(y), r12=80(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 111
LDI r1, 26
LDI r2, 370
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 159
LDI r7, 76
LDI r8, 72
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 158
LDI r12, 80
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
