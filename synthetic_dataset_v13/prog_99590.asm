; DESCRIPTION: Composite: Creates a black circular shape at (244, 73) with radius 57 then Sets a single red pixel at (85, 9) then Draws a orange line from (179, 47) to (281, 183).
; PLAN: r0=244(x), r1=73(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=9(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=179(x1), r11=47(y1), r12=281(x2), r13=183(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 73
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 9
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 179
LDI r11, 47
LDI r12, 281
LDI r13, 183
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
