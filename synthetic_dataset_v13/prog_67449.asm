; DESCRIPTION: Composite: Places a orange line segment connecting (73, 231) to (495, 166) then Creates a magenta rectangular region at (146, 117) spanning 100 by 91 pixels then Sets a single white pixel at (19, 97).
; PLAN: r0=73(x1), r1=231(y1), r2=495(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=117(y), r7=100(width), r8=91(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=19(x), r11=97(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 231
LDI r2, 495
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 117
LDI r7, 100
LDI r8, 91
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 97
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
