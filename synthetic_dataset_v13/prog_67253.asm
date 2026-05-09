; DESCRIPTION: Composite: Renders a orange line between points (49, 2) and (321, 238) then Renders a orange disk with center (230, 105) and radius 54 then Sets a single black pixel at (49, 85).
; PLAN: r0=49(x1), r1=2(y1), r2=321(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=105(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=49(x), r11=85(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 49
LDI r1, 2
LDI r2, 321
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 105
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 49
LDI r11, 85
LDI r12, 0x000000
PSET r10, r11, r12
HALT
