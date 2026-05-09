; DESCRIPTION: Composite: Places a purple line segment connecting (0, 249) to (289, 134) then Places a red dot at position (65, 162) then Draws a black circle centered at (287, 192) with radius 56.
; PLAN: r0=0(x1), r1=249(y1), r2=289(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=162(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=287(x), r11=192(y), r12=56(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 249
LDI r2, 289
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 162
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 287
LDI r11, 192
LDI r12, 56
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
