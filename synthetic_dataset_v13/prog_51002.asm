; DESCRIPTION: Composite: Places a purple line segment connecting (449, 119) to (158, 245) then Places a blue circle of radius 29 at center (420, 179) then Sets a single cyan pixel at (277, 236).
; PLAN: r0=449(x1), r1=119(y1), r2=158(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=179(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=277(x), r11=236(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 449
LDI r1, 119
LDI r2, 158
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 179
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 277
LDI r11, 236
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
