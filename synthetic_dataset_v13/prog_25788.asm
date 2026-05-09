; DESCRIPTION: Composite: Draws a red line from (350, 253) to (90, 12) then Sets a single blue pixel at (178, 14) then Places a purple circle of radius 19 at center (264, 73).
; PLAN: r0=350(x1), r1=253(y1), r2=90(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=14(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=264(x), r11=73(y), r12=19(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 350
LDI r1, 253
LDI r2, 90
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 14
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 264
LDI r11, 73
LDI r12, 19
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
