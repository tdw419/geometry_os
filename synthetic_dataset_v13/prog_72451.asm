; DESCRIPTION: Composite: Places a orange dot at position (24, 181) then Draws a black line from (335, 194) to (103, 26) then Creates a magenta circular shape at (203, 179) with radius 33.
; PLAN: r0=24(x), r1=181(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=335(x1), r6=194(y1), r7=103(x2), r8=26(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=203(x), r11=179(y), r12=33(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 181
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 335
LDI r6, 194
LDI r7, 103
LDI r8, 26
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 179
LDI r12, 33
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
