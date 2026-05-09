; DESCRIPTION: Composite: Places a black line segment connecting (454, 119) to (436, 143) then Places a red dot at position (490, 101) then Places a black circle of radius 49 at center (111, 166).
; PLAN: r0=454(x1), r1=119(y1), r2=436(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=490(x), r6=101(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=111(x), r11=166(y), r12=49(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 119
LDI r2, 436
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 101
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 111
LDI r11, 166
LDI r12, 49
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
