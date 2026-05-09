; DESCRIPTION: Composite: Draws a orange line from (37, 234) to (64, 44) then Creates a orange circular shape at (378, 127) with radius 74 then Places a black dot at position (484, 221).
; PLAN: r0=37(x1), r1=234(y1), r2=64(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=127(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=484(x), r11=221(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 37
LDI r1, 234
LDI r2, 64
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 127
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 484
LDI r11, 221
LDI r12, 0x000000
PSET r10, r11, r12
HALT
