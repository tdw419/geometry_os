; DESCRIPTION: Composite: Places a black dot at position (483, 100) then Draws a orange circle centered at (395, 155) with radius 39 then Draws a yellow line from (434, 126) to (304, 184).
; PLAN: r0=483(x), r1=100(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=155(y), r7=39(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=434(x1), r11=126(y1), r12=304(x2), r13=184(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 483
LDI r1, 100
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 395
LDI r6, 155
LDI r7, 39
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 434
LDI r11, 126
LDI r12, 304
LDI r13, 184
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
