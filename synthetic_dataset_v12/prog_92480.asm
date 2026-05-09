; DESCRIPTION: Composite: Places a green line segment connecting (475, 191) to (142, 127) then Creates a yellow circular shape at (111, 161) with radius 58 then Sets a single black pixel at (299, 233).
; PLAN: r0=475(x1), r1=191(y1), r2=142(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=161(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=299(x), r11=233(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 475
LDI r1, 191
LDI r2, 142
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 161
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 299
LDI r11, 233
LDI r12, 0x000000
PSET r10, r11, r12
HALT
