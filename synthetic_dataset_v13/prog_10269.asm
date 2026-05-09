; DESCRIPTION: Composite: Draws a green circle centered at (100, 205) with radius 17 then Sets a single yellow pixel at (18, 111) then Places a orange line segment connecting (358, 55) to (185, 84).
; PLAN: r0=100(x), r1=205(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x), r6=111(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=358(x1), r11=55(y1), r12=185(x2), r13=84(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 205
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 111
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 358
LDI r11, 55
LDI r12, 185
LDI r13, 84
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
