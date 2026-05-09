; DESCRIPTION: Composite: Draws a cyan line from (283, 23) to (414, 241) then Sets a single black pixel at (92, 202) then Creates a orange circular shape at (420, 105) with radius 35.
; PLAN: r0=283(x1), r1=23(y1), r2=414(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=202(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=420(x), r11=105(y), r12=35(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 283
LDI r1, 23
LDI r2, 414
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 202
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 420
LDI r11, 105
LDI r12, 35
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
