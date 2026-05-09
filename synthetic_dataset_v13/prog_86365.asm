; DESCRIPTION: Composite: Renders a purple line between points (496, 226) and (256, 130) then Places a yellow dot at position (236, 171) then Creates a purple circular shape at (97, 136) with radius 70.
; PLAN: r0=496(x1), r1=226(y1), r2=256(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=171(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=97(x), r11=136(y), r12=70(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 496
LDI r1, 226
LDI r2, 256
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 171
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 97
LDI r11, 136
LDI r12, 70
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
