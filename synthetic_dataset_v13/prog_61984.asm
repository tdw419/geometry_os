; DESCRIPTION: Composite: Places a cyan circle of radius 23 at center (282, 34) then Creates a orange rectangular region at (309, 85) spanning 34 by 119 pixels then Places a magenta line segment connecting (471, 57) to (248, 236).
; PLAN: r0=282(x), r1=34(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=85(y), r7=34(width), r8=119(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=471(x1), r11=57(y1), r12=248(x2), r13=236(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 34
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 85
LDI r7, 34
LDI r8, 119
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 57
LDI r12, 248
LDI r13, 236
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
