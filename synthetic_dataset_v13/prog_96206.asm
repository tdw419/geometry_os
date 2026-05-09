; DESCRIPTION: Composite: Draws a white line from (136, 72) to (93, 155) then Places a black circle of radius 75 at center (244, 164) then Sets a single red pixel at (447, 5).
; PLAN: r0=136(x1), r1=72(y1), r2=93(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=164(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=447(x), r11=5(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 72
LDI r2, 93
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 164
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 447
LDI r11, 5
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
