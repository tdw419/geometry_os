; DESCRIPTION: Composite: Sets a single purple pixel at (31, 107) then Creates a black circular shape at (312, 176) with radius 79 then Draws a orange line from (21, 161) to (342, 4).
; PLAN: r0=31(x), r1=107(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=176(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=21(x1), r11=161(y1), r12=342(x2), r13=4(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 107
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 176
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 21
LDI r11, 161
LDI r12, 342
LDI r13, 4
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
