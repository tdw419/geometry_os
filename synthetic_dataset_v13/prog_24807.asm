; DESCRIPTION: Composite: Places a blue circle of radius 75 at center (215, 143) then Renders a purple line between points (97, 170) and (372, 161) then Sets a single green pixel at (483, 140).
; PLAN: r0=215(x), r1=143(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x1), r6=170(y1), r7=372(x2), r8=161(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=483(x), r11=140(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 143
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 170
LDI r7, 372
LDI r8, 161
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 483
LDI r11, 140
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
