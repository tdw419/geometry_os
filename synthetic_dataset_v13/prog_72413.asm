; DESCRIPTION: Composite: Draws a green rectangle at (79, 89) with width 61 and height 26 then Sets a single blue pixel at (444, 61) then Creates a orange circular shape at (83, 104) with radius 25.
; PLAN: r0=79(x), r1=89(y), r2=61(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=61(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=83(x), r11=104(y), r12=25(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 79
LDI r1, 89
LDI r2, 61
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 61
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 83
LDI r11, 104
LDI r12, 25
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
