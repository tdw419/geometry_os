; DESCRIPTION: Composite: Draws a red circle centered at (194, 158) with radius 57 then Sets a single cyan pixel at (109, 123) then Places a purple line segment connecting (467, 140) to (476, 248).
; PLAN: r0=194(x), r1=158(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=123(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=467(x1), r11=140(y1), r12=476(x2), r13=248(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 158
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 123
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 467
LDI r11, 140
LDI r12, 476
LDI r13, 248
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
