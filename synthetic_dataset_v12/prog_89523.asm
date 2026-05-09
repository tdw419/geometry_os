; DESCRIPTION: Composite: Sets a single yellow pixel at (203, 31) then Creates a blue circular shape at (87, 198) with radius 43 then Renders a black line between points (235, 28) and (396, 254).
; PLAN: r0=203(x), r1=31(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=198(y), r7=43(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x1), r11=28(y1), r12=396(x2), r13=254(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 31
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 87
LDI r6, 198
LDI r7, 43
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 28
LDI r12, 396
LDI r13, 254
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
