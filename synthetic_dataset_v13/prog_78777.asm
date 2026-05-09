; DESCRIPTION: Composite: Draws a black circle centered at (237, 185) with radius 67 then Sets a single blue pixel at (170, 36) then Draws a green line from (273, 43) to (89, 243).
; PLAN: r0=237(x), r1=185(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=36(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=273(x1), r11=43(y1), r12=89(x2), r13=243(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 185
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 36
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 273
LDI r11, 43
LDI r12, 89
LDI r13, 243
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
