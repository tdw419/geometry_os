; DESCRIPTION: Composite: Places a white line segment connecting (63, 0) to (364, 14) then Creates a purple rectangular region at (13, 101) spanning 57 by 102 pixels then Sets a single cyan pixel at (166, 178).
; PLAN: r0=63(x1), r1=0(y1), r2=364(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=101(y), r7=57(width), r8=102(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=166(x), r11=178(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 63
LDI r1, 0
LDI r2, 364
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 101
LDI r7, 57
LDI r8, 102
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 178
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
