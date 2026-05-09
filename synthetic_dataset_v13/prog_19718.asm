; DESCRIPTION: Composite: Places a purple circle of radius 61 at center (84, 182) then Places a purple line segment connecting (269, 58) to (354, 243) then Sets a single red pixel at (136, 186).
; PLAN: r0=84(x), r1=182(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x1), r6=58(y1), r7=354(x2), r8=243(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=136(x), r11=186(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 84
LDI r1, 182
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 58
LDI r7, 354
LDI r8, 243
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 186
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
