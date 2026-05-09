; DESCRIPTION: Composite: Draws a green line from (319, 246) to (342, 23) then Sets a single red pixel at (475, 91) then Places a blue circle of radius 26 at center (415, 82).
; PLAN: r0=319(x1), r1=246(y1), r2=342(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=475(x), r6=91(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=82(y), r12=26(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 246
LDI r2, 342
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 91
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 415
LDI r11, 82
LDI r12, 26
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
