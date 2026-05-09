; DESCRIPTION: Composite: Draws a blue line from (339, 61) to (179, 114) then Places a black dot at position (58, 44) then Draws a purple circle centered at (90, 144) with radius 11.
; PLAN: r0=339(x1), r1=61(y1), r2=179(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=58(x), r6=44(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=90(x), r11=144(y), r12=11(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 339
LDI r1, 61
LDI r2, 179
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 44
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 90
LDI r11, 144
LDI r12, 11
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
