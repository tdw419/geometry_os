; DESCRIPTION: Composite: Draws a orange line from (45, 220) to (473, 65) then Sets a single black pixel at (71, 71) then Places a purple circle of radius 60 at center (257, 116).
; PLAN: r0=45(x1), r1=220(y1), r2=473(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=71(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=257(x), r11=116(y), r12=60(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 45
LDI r1, 220
LDI r2, 473
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 71
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 257
LDI r11, 116
LDI r12, 60
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
