; DESCRIPTION: Composite: Renders a blue disk with center (166, 64) and radius 46 then Sets a single yellow pixel at (93, 80) then Renders a purple line between points (132, 33) and (35, 141).
; PLAN: r0=166(x), r1=64(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=80(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=132(x1), r11=33(y1), r12=35(x2), r13=141(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 64
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 80
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 132
LDI r11, 33
LDI r12, 35
LDI r13, 141
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
