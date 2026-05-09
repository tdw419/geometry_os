; DESCRIPTION: Composite: Sets a single red pixel at (183, 86) then Draws a orange line from (99, 10) to (135, 114) then Creates a cyan circular shape at (417, 188) with radius 56.
; PLAN: r0=183(x), r1=86(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=99(x1), r6=10(y1), r7=135(x2), r8=114(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=417(x), r11=188(y), r12=56(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 183
LDI r1, 86
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 99
LDI r6, 10
LDI r7, 135
LDI r8, 114
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 188
LDI r12, 56
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
