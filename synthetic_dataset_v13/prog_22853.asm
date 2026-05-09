; DESCRIPTION: Composite: Places a orange dot at position (350, 26) then Creates a green circular shape at (411, 110) with radius 74 then Draws a black line from (79, 199) to (36, 39).
; PLAN: r0=350(x), r1=26(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=110(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x1), r11=199(y1), r12=36(x2), r13=39(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 26
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 411
LDI r6, 110
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 199
LDI r12, 36
LDI r13, 39
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
