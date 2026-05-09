; DESCRIPTION: Composite: Creates a purple circular shape at (302, 76) with radius 55 then Sets a single white pixel at (475, 117) then Draws a orange line from (261, 24) to (427, 80).
; PLAN: r0=302(x), r1=76(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x), r6=117(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=261(x1), r11=24(y1), r12=427(x2), r13=80(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 76
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 117
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 261
LDI r11, 24
LDI r12, 427
LDI r13, 80
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
