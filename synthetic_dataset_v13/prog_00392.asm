; DESCRIPTION: Composite: Draws a purple circle centered at (109, 119) with radius 76 then Sets a single blue pixel at (441, 236) then Places a cyan line segment connecting (319, 111) to (306, 49).
; PLAN: r0=109(x), r1=119(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x), r6=236(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=319(x1), r11=111(y1), r12=306(x2), r13=49(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 119
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 236
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 319
LDI r11, 111
LDI r12, 306
LDI r13, 49
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
