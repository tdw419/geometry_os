; DESCRIPTION: Composite: Places a orange line segment connecting (341, 182) to (2, 176) then Creates a red rectangular region at (110, 123) spanning 84 by 33 pixels then Places a black dot at position (462, 194).
; PLAN: r0=341(x1), r1=182(y1), r2=2(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=123(y), r7=84(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=462(x), r11=194(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 341
LDI r1, 182
LDI r2, 2
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 123
LDI r7, 84
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 194
LDI r12, 0x000000
PSET r10, r11, r12
HALT
