; DESCRIPTION: Composite: Places a orange line segment connecting (131, 86) to (436, 101) then Places a red circle of radius 19 at center (110, 145) then Sets a single red pixel at (385, 48).
; PLAN: r0=131(x1), r1=86(y1), r2=436(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=145(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x), r11=48(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 131
LDI r1, 86
LDI r2, 436
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 145
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 48
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
