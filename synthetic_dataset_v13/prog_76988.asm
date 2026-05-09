; DESCRIPTION: Composite: Draws a orange line from (172, 23) to (5, 202) then Draws a purple circle centered at (409, 65) with radius 64 then Sets a single blue pixel at (286, 75).
; PLAN: r0=172(x1), r1=23(y1), r2=5(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=65(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=286(x), r11=75(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 172
LDI r1, 23
LDI r2, 5
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 65
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 286
LDI r11, 75
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
