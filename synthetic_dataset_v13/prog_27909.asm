; DESCRIPTION: Composite: Places a red line segment connecting (360, 185) to (7, 140) then Sets a single yellow pixel at (418, 14) then Places a black circle of radius 23 at center (115, 101).
; PLAN: r0=360(x1), r1=185(y1), r2=7(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=14(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=101(y), r12=23(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 185
LDI r2, 7
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 14
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 115
LDI r11, 101
LDI r12, 23
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
