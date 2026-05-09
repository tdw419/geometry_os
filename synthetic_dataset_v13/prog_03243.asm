; DESCRIPTION: Composite: Renders a yellow line between points (391, 176) and (232, 29) then Sets a single orange pixel at (464, 24) then Renders a blue disk with center (484, 30) and radius 27.
; PLAN: r0=391(x1), r1=176(y1), r2=232(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=24(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=484(x), r11=30(y), r12=27(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 176
LDI r2, 232
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 24
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 484
LDI r11, 30
LDI r12, 27
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
