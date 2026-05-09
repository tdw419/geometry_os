; DESCRIPTION: Composite: Renders a magenta disk with center (179, 124) and radius 41 then Sets a single blue pixel at (151, 148) then Places a purple line segment connecting (401, 106) to (390, 40).
; PLAN: r0=179(x), r1=124(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=148(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=401(x1), r11=106(y1), r12=390(x2), r13=40(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 124
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 148
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 401
LDI r11, 106
LDI r12, 390
LDI r13, 40
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
