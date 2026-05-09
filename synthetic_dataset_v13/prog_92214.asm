; DESCRIPTION: Composite: Creates a purple circular shape at (374, 95) with radius 33 then Sets a single blue pixel at (129, 123) then Draws a black line from (326, 72) to (78, 135).
; PLAN: r0=374(x), r1=95(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=123(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=326(x1), r11=72(y1), r12=78(x2), r13=135(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 95
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 123
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 326
LDI r11, 72
LDI r12, 78
LDI r13, 135
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
