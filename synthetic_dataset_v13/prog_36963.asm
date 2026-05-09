; DESCRIPTION: Composite: Renders a white line between points (76, 23) and (107, 105) then Sets a single magenta pixel at (126, 84) then Places a purple circle of radius 68 at center (269, 123).
; PLAN: r0=76(x1), r1=23(y1), r2=107(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=84(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=269(x), r11=123(y), r12=68(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 76
LDI r1, 23
LDI r2, 107
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 84
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 269
LDI r11, 123
LDI r12, 68
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
