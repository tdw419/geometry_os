; DESCRIPTION: Composite: Draws a purple line from (415, 182) to (49, 119) then Draws a purple circle centered at (414, 100) with radius 13 then Sets a single yellow pixel at (509, 188).
; PLAN: r0=415(x1), r1=182(y1), r2=49(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=100(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=509(x), r11=188(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 415
LDI r1, 182
LDI r2, 49
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 100
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 509
LDI r11, 188
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
