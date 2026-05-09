; DESCRIPTION: Composite: Places a black dot at position (253, 232) then Places a purple line segment connecting (22, 110) to (175, 17) then Draws a purple circle centered at (273, 90) with radius 28.
; PLAN: r0=253(x), r1=232(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=22(x1), r6=110(y1), r7=175(x2), r8=17(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=273(x), r11=90(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 253
LDI r1, 232
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 22
LDI r6, 110
LDI r7, 175
LDI r8, 17
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 90
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
