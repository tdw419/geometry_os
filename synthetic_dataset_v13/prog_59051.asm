; DESCRIPTION: Composite: Places a cyan dot at position (424, 101) then Draws a cyan line from (321, 105) to (478, 91) then Creates a red circular shape at (34, 86) with radius 11.
; PLAN: r0=424(x), r1=101(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=321(x1), r6=105(y1), r7=478(x2), r8=91(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=34(x), r11=86(y), r12=11(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 424
LDI r1, 101
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 321
LDI r6, 105
LDI r7, 478
LDI r8, 91
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 86
LDI r12, 11
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
