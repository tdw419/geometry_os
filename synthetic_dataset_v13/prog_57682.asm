; DESCRIPTION: Composite: Places a yellow line segment connecting (330, 18) to (197, 175) then Sets a single black pixel at (39, 149) then Creates a purple circular shape at (363, 137) with radius 39.
; PLAN: r0=330(x1), r1=18(y1), r2=197(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=39(x), r6=149(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=363(x), r11=137(y), r12=39(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 18
LDI r2, 197
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 149
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 363
LDI r11, 137
LDI r12, 39
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
