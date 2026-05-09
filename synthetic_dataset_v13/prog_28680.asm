; DESCRIPTION: Composite: Places a black dot at position (451, 107) then Draws a cyan line from (343, 201) to (316, 164) then Draws a red circle centered at (333, 175) with radius 54.
; PLAN: r0=451(x), r1=107(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=343(x1), r6=201(y1), r7=316(x2), r8=164(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=175(y), r12=54(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 451
LDI r1, 107
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 343
LDI r6, 201
LDI r7, 316
LDI r8, 164
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 175
LDI r12, 54
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
