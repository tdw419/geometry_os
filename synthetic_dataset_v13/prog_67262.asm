; DESCRIPTION: Composite: Renders a orange line between points (23, 56) and (266, 105) then Renders a blue disk with center (330, 78) and radius 51 then Sets a single red pixel at (185, 2).
; PLAN: r0=23(x1), r1=56(y1), r2=266(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=78(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x), r11=2(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 23
LDI r1, 56
LDI r2, 266
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 78
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 2
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
