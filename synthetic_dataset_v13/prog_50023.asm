; DESCRIPTION: Composite: Places a orange line segment connecting (390, 130) to (299, 145) then Draws a orange circle centered at (353, 167) with radius 76 then Sets a single cyan pixel at (241, 78).
; PLAN: r0=390(x1), r1=130(y1), r2=299(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=167(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x), r11=78(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 130
LDI r2, 299
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 167
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 78
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
