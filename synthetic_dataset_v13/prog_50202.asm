; DESCRIPTION: Composite: Places a orange line segment connecting (494, 182) to (0, 227) then Sets a single white pixel at (405, 192) then Places a yellow circle of radius 55 at center (389, 191).
; PLAN: r0=494(x1), r1=182(y1), r2=0(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=192(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=389(x), r11=191(y), r12=55(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 494
LDI r1, 182
LDI r2, 0
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 192
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 389
LDI r11, 191
LDI r12, 55
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
