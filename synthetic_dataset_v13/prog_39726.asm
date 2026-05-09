; DESCRIPTION: Composite: Draws a green line from (209, 87) to (465, 172) then Sets a single orange pixel at (118, 56) then Creates a white circular shape at (166, 162) with radius 54.
; PLAN: r0=209(x1), r1=87(y1), r2=465(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=56(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=166(x), r11=162(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 209
LDI r1, 87
LDI r2, 465
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 56
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 166
LDI r11, 162
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
