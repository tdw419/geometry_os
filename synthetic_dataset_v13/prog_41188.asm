; DESCRIPTION: Composite: Renders a magenta line between points (226, 157) and (368, 26) then Sets a single black pixel at (492, 190) then Creates a blue circular shape at (285, 101) with radius 67.
; PLAN: r0=226(x1), r1=157(y1), r2=368(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=492(x), r6=190(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=285(x), r11=101(y), r12=67(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 157
LDI r2, 368
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 190
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 285
LDI r11, 101
LDI r12, 67
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
