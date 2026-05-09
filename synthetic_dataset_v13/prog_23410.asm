; DESCRIPTION: Composite: Places a orange dot at position (198, 179) then Draws a magenta line from (475, 227) to (299, 159) then Creates a yellow circular shape at (306, 177) with radius 58.
; PLAN: r0=198(x), r1=179(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=475(x1), r6=227(y1), r7=299(x2), r8=159(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=177(y), r12=58(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 198
LDI r1, 179
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 475
LDI r6, 227
LDI r7, 299
LDI r8, 159
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 177
LDI r12, 58
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
