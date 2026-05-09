; DESCRIPTION: Composite: Places a orange dot at position (179, 162) then Creates a red rectangular region at (22, 134) spanning 38 by 13 pixels then Places a green line segment connecting (497, 156) to (200, 75).
; PLAN: r0=179(x), r1=162(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=22(x), r6=134(y), r7=38(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=156(y1), r12=200(x2), r13=75(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 162
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 22
LDI r6, 134
LDI r7, 38
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 156
LDI r12, 200
LDI r13, 75
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
