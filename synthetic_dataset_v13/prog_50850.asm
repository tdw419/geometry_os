; DESCRIPTION: Composite: Places a green dot at position (99, 240) then Places a purple line segment connecting (304, 199) to (396, 31) then Creates a orange circular shape at (99, 105) with radius 59.
; PLAN: r0=99(x), r1=240(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=304(x1), r6=199(y1), r7=396(x2), r8=31(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=105(y), r12=59(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 99
LDI r1, 240
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 304
LDI r6, 199
LDI r7, 396
LDI r8, 31
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 105
LDI r12, 59
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
