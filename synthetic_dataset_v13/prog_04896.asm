; DESCRIPTION: Composite: Creates a purple circular shape at (310, 62) with radius 51 then Sets a single blue pixel at (331, 80) then Renders a green line between points (32, 240) and (40, 28).
; PLAN: r0=310(x), r1=62(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x), r6=80(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=32(x1), r11=240(y1), r12=40(x2), r13=28(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 62
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 80
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 32
LDI r11, 240
LDI r12, 40
LDI r13, 28
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
