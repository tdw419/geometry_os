; DESCRIPTION: Composite: Draws a orange line from (336, 244) to (316, 112) then Renders a orange disk with center (93, 84) and radius 55 then Sets a single purple pixel at (23, 194).
; PLAN: r0=336(x1), r1=244(y1), r2=316(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=84(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=23(x), r11=194(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 336
LDI r1, 244
LDI r2, 316
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 84
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 23
LDI r11, 194
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
