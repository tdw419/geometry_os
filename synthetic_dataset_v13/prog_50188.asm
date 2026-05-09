; DESCRIPTION: Composite: Places a black line segment connecting (78, 232) to (209, 48) then Places a purple dot at position (326, 124) then Creates a green circular shape at (229, 182) with radius 73.
; PLAN: r0=78(x1), r1=232(y1), r2=209(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=124(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=229(x), r11=182(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 78
LDI r1, 232
LDI r2, 209
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 124
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 229
LDI r11, 182
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
