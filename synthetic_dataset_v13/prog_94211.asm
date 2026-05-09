; DESCRIPTION: Composite: Renders a blue line between points (278, 78) and (230, 251) then Places a red dot at position (312, 156) then Renders a purple disk with center (355, 122) and radius 53.
; PLAN: r0=278(x1), r1=78(y1), r2=230(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=156(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=355(x), r11=122(y), r12=53(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 78
LDI r2, 230
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 156
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 355
LDI r11, 122
LDI r12, 53
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
