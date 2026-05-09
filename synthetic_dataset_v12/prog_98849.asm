; DESCRIPTION: Composite: Places a yellow dot at position (261, 161) then Draws a purple line from (141, 105) to (148, 243) then Creates a orange circular shape at (191, 191) with radius 13.
; PLAN: r0=261(x), r1=161(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=141(x1), r6=105(y1), r7=148(x2), r8=243(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=191(x), r11=191(y), r12=13(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 261
LDI r1, 161
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 141
LDI r6, 105
LDI r7, 148
LDI r8, 243
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 191
LDI r12, 13
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
