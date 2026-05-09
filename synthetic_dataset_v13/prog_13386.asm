; DESCRIPTION: Composite: Places a purple line segment connecting (105, 155) to (206, 169) then Places a green dot at position (477, 170) then Places a red circle of radius 46 at center (310, 137).
; PLAN: r0=105(x1), r1=155(y1), r2=206(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=170(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=310(x), r11=137(y), r12=46(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 155
LDI r2, 206
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 170
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 310
LDI r11, 137
LDI r12, 46
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
