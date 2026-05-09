; DESCRIPTION: Composite: Places a yellow dot at position (400, 123) then Places a purple line segment connecting (110, 101) to (465, 160) then Places a black circle of radius 75 at center (179, 122).
; PLAN: r0=400(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=110(x1), r6=101(y1), r7=465(x2), r8=160(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=122(y), r12=75(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 400
LDI r1, 123
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 110
LDI r6, 101
LDI r7, 465
LDI r8, 160
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 122
LDI r12, 75
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
