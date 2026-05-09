; DESCRIPTION: Composite: Draws a black circle centered at (433, 41) with radius 13 then Sets a single red pixel at (374, 21) then Renders a orange line between points (119, 85) and (105, 172).
; PLAN: r0=433(x), r1=41(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=21(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=119(x1), r11=85(y1), r12=105(x2), r13=172(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 41
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 21
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 119
LDI r11, 85
LDI r12, 105
LDI r13, 172
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
