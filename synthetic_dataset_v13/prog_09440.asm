; DESCRIPTION: Composite: Places a black dot at position (222, 131) then Creates a magenta circular shape at (150, 218) with radius 37 then Places a orange line segment connecting (17, 236) to (438, 222).
; PLAN: r0=222(x), r1=131(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=218(y), r7=37(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=17(x1), r11=236(y1), r12=438(x2), r13=222(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 131
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 150
LDI r6, 218
LDI r7, 37
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 17
LDI r11, 236
LDI r12, 438
LDI r13, 222
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
