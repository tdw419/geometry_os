; DESCRIPTION: Composite: Places a white line segment connecting (364, 115) to (230, 84) then Sets a single magenta pixel at (273, 99) then Places a blue circle of radius 41 at center (97, 73).
; PLAN: r0=364(x1), r1=115(y1), r2=230(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=99(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=97(x), r11=73(y), r12=41(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 115
LDI r2, 230
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 99
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 97
LDI r11, 73
LDI r12, 41
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
