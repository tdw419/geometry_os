; DESCRIPTION: Composite: Places a orange dot at position (125, 96) then Draws a magenta line from (440, 89) to (153, 89) then Creates a purple circular shape at (62, 138) with radius 35.
; PLAN: r0=125(x), r1=96(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=440(x1), r6=89(y1), r7=153(x2), r8=89(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=138(y), r12=35(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 96
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 440
LDI r6, 89
LDI r7, 153
LDI r8, 89
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 138
LDI r12, 35
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
