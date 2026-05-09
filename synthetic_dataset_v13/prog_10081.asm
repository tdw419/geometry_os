; DESCRIPTION: Composite: Places a blue dot at position (297, 153) then Places a yellow line segment connecting (366, 17) to (456, 30) then Creates a purple circular shape at (162, 83) with radius 23.
; PLAN: r0=297(x), r1=153(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=366(x1), r6=17(y1), r7=456(x2), r8=30(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=162(x), r11=83(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 153
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 366
LDI r6, 17
LDI r7, 456
LDI r8, 30
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 83
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
