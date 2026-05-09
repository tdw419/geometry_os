; DESCRIPTION: Composite: Places a black line segment connecting (235, 60) to (177, 82) then Places a orange dot at position (237, 250) then Draws a purple circle centered at (431, 88) with radius 61.
; PLAN: r0=235(x1), r1=60(y1), r2=177(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=250(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=88(y), r12=61(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 235
LDI r1, 60
LDI r2, 177
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 250
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 431
LDI r11, 88
LDI r12, 61
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
