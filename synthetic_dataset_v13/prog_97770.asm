; DESCRIPTION: Composite: Creates a green circular shape at (442, 90) with radius 32 then Sets a single yellow pixel at (249, 61) then Renders a green line between points (17, 22) and (185, 181).
; PLAN: r0=442(x), r1=90(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=61(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=17(x1), r11=22(y1), r12=185(x2), r13=181(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 90
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 61
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 17
LDI r11, 22
LDI r12, 185
LDI r13, 181
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
