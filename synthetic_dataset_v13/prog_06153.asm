; DESCRIPTION: Composite: Draws a green line from (260, 63) to (261, 45) then Places a black dot at position (136, 142) then Places a orange circle of radius 27 at center (158, 116).
; PLAN: r0=260(x1), r1=63(y1), r2=261(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=142(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=116(y), r12=27(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 260
LDI r1, 63
LDI r2, 261
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 142
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 158
LDI r11, 116
LDI r12, 27
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
