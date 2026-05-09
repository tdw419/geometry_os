; DESCRIPTION: Composite: Places a orange dot at position (142, 221) then Places a black line segment connecting (347, 151) to (455, 84) then Creates a green circular shape at (57, 175) with radius 34.
; PLAN: r0=142(x), r1=221(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=347(x1), r6=151(y1), r7=455(x2), r8=84(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=57(x), r11=175(y), r12=34(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 221
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 347
LDI r6, 151
LDI r7, 455
LDI r8, 84
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 175
LDI r12, 34
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
