; DESCRIPTION: Composite: Renders a purple line between points (148, 116) and (325, 49) then Draws a yellow circle centered at (222, 142) with radius 70 then Sets a single blue pixel at (384, 139).
; PLAN: r0=148(x1), r1=116(y1), r2=325(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=142(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=384(x), r11=139(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 116
LDI r2, 325
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 142
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 384
LDI r11, 139
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
