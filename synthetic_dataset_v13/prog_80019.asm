; DESCRIPTION: Composite: Places a cyan line segment connecting (347, 14) to (115, 144) then Sets a single blue pixel at (5, 153) then Renders a purple disk with center (53, 139) and radius 22.
; PLAN: r0=347(x1), r1=14(y1), r2=115(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=153(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=53(x), r11=139(y), r12=22(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 14
LDI r2, 115
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 153
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 53
LDI r11, 139
LDI r12, 22
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
