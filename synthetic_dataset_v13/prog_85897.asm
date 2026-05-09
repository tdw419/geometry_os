; DESCRIPTION: Composite: Renders a blue line between points (359, 198) and (357, 196) then Sets a single orange pixel at (282, 192) then Creates a blue circular shape at (288, 163) with radius 64.
; PLAN: r0=359(x1), r1=198(y1), r2=357(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=192(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=288(x), r11=163(y), r12=64(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 198
LDI r2, 357
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 192
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 288
LDI r11, 163
LDI r12, 64
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
