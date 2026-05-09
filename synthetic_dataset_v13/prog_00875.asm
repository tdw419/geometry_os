; DESCRIPTION: Composite: Draws a blue line from (466, 30) to (503, 101) then Sets a single blue pixel at (176, 157) then Creates a yellow circular shape at (141, 210) with radius 35.
; PLAN: r0=466(x1), r1=30(y1), r2=503(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=157(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=210(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 466
LDI r1, 30
LDI r2, 503
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 157
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 141
LDI r11, 210
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
