; DESCRIPTION: Composite: Places a black dot at position (376, 9) then Creates a purple circular shape at (108, 201) with radius 46 then Draws a orange line from (172, 124) to (437, 151).
; PLAN: r0=376(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=201(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x1), r11=124(y1), r12=437(x2), r13=151(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 9
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 108
LDI r6, 201
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 124
LDI r12, 437
LDI r13, 151
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
