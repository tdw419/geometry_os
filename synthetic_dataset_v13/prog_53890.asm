; DESCRIPTION: Composite: Renders a black line between points (329, 157) and (86, 149) then Sets a single black pixel at (363, 236) then Draws a white circle centered at (97, 136) with radius 73.
; PLAN: r0=329(x1), r1=157(y1), r2=86(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=236(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=97(x), r11=136(y), r12=73(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 157
LDI r2, 86
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 236
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 97
LDI r11, 136
LDI r12, 73
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
