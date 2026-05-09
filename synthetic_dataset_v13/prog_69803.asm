; DESCRIPTION: Composite: Renders a orange line between points (44, 52) and (374, 111) then Draws a black circle centered at (246, 176) with radius 53 then Sets a single black pixel at (338, 145).
; PLAN: r0=44(x1), r1=52(y1), r2=374(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=176(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x), r11=145(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 44
LDI r1, 52
LDI r2, 374
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 176
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 145
LDI r12, 0x000000
PSET r10, r11, r12
HALT
