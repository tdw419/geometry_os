; DESCRIPTION: Composite: Renders a purple disk with center (257, 201) and radius 45 then Sets a single purple pixel at (221, 19) then Renders a black line between points (332, 122) and (77, 44).
; PLAN: r0=257(x), r1=201(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x), r6=19(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=332(x1), r11=122(y1), r12=77(x2), r13=44(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 201
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 19
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 332
LDI r11, 122
LDI r12, 77
LDI r13, 44
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
