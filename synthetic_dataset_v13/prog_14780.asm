; DESCRIPTION: Composite: Places a black dot at position (306, 4) then Draws a purple circle centered at (402, 141) with radius 49 then Draws a purple line from (451, 131) to (344, 201).
; PLAN: r0=306(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=402(x), r6=141(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=451(x1), r11=131(y1), r12=344(x2), r13=201(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 4
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 402
LDI r6, 141
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 451
LDI r11, 131
LDI r12, 344
LDI r13, 201
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
