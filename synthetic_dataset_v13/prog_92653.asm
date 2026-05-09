; DESCRIPTION: Composite: Places a purple circle of radius 24 at center (358, 49) then Draws a cyan line from (399, 155) to (119, 125) then Sets a single yellow pixel at (390, 154).
; PLAN: r0=358(x), r1=49(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x1), r6=155(y1), r7=119(x2), r8=125(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=154(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 49
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 155
LDI r7, 119
LDI r8, 125
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 154
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
