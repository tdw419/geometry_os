; DESCRIPTION: Composite: Renders a red disk with center (183, 134) and radius 44 then Sets a single black pixel at (505, 201) then Draws a purple line from (130, 139) to (474, 69).
; PLAN: r0=183(x), r1=134(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=505(x), r6=201(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=130(x1), r11=139(y1), r12=474(x2), r13=69(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 134
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 505
LDI r6, 201
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 130
LDI r11, 139
LDI r12, 474
LDI r13, 69
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
