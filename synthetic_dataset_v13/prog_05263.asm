; DESCRIPTION: Composite: Draws a black circle centered at (422, 110) with radius 78 then Sets a single blue pixel at (211, 63) then Draws a green line from (400, 161) to (300, 170).
; PLAN: r0=422(x), r1=110(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=63(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=400(x1), r11=161(y1), r12=300(x2), r13=170(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 110
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 63
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 400
LDI r11, 161
LDI r12, 300
LDI r13, 170
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
