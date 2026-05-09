; DESCRIPTION: Composite: Places a purple circle of radius 45 at center (381, 76) then Sets a single red pixel at (39, 134) then Places a orange line segment connecting (98, 117) to (293, 199).
; PLAN: r0=381(x), r1=76(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=134(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=98(x1), r11=117(y1), r12=293(x2), r13=199(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 76
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 134
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 98
LDI r11, 117
LDI r12, 293
LDI r13, 199
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
