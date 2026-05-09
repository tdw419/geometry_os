; DESCRIPTION: Composite: Draws a cyan circle centered at (122, 232) with radius 16 then Sets a single black pixel at (246, 118) then Places a purple line segment connecting (205, 68) to (209, 205).
; PLAN: r0=122(x), r1=232(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=118(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=205(x1), r11=68(y1), r12=209(x2), r13=205(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 232
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 118
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 205
LDI r11, 68
LDI r12, 209
LDI r13, 205
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
