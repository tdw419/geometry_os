; DESCRIPTION: Composite: Places a orange dot at position (272, 176) then Places a blue circle of radius 41 at center (454, 153) then Places a yellow line segment connecting (189, 77) to (444, 71).
; PLAN: r0=272(x), r1=176(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=153(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=189(x1), r11=77(y1), r12=444(x2), r13=71(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 176
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 454
LDI r6, 153
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 189
LDI r11, 77
LDI r12, 444
LDI r13, 71
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
