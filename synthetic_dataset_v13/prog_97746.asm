; DESCRIPTION: Composite: Places a orange dot at position (490, 244) then Renders a orange line between points (56, 0) and (17, 39) then Creates a magenta rectangular region at (179, 26) spanning 39 by 87 pixels.
; PLAN: r0=490(x), r1=244(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=56(x1), r6=0(y1), r7=17(x2), r8=39(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=26(y), r12=39(width), r13=87(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 244
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 56
LDI r6, 0
LDI r7, 17
LDI r8, 39
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 26
LDI r12, 39
LDI r13, 87
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
