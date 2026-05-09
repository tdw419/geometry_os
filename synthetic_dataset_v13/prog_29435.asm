; DESCRIPTION: Composite: Draws a yellow line from (364, 239) to (414, 174) then Places a red dot at position (477, 186) then Places a purple circle of radius 76 at center (391, 84).
; PLAN: r0=364(x1), r1=239(y1), r2=414(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=186(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=391(x), r11=84(y), r12=76(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 239
LDI r2, 414
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 186
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 391
LDI r11, 84
LDI r12, 76
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
