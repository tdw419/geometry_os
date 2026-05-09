; DESCRIPTION: Composite: Sets a single green pixel at (508, 102) then Creates a purple circular shape at (436, 169) with radius 37 then Draws a black line from (337, 4) to (370, 52).
; PLAN: r0=508(x), r1=102(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=436(x), r6=169(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x1), r11=4(y1), r12=370(x2), r13=52(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 102
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 436
LDI r6, 169
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 4
LDI r12, 370
LDI r13, 52
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
