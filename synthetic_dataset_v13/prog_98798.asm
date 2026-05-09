; DESCRIPTION: Composite: Draws a purple line from (49, 0) to (88, 236) then Sets a single yellow pixel at (410, 118) then Creates a blue circular shape at (281, 115) with radius 37.
; PLAN: r0=49(x1), r1=0(y1), r2=88(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=118(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=115(y), r12=37(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 0
LDI r2, 88
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 118
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 281
LDI r11, 115
LDI r12, 37
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
