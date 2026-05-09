; DESCRIPTION: Composite: Sets a single red pixel at (197, 234) then Renders a red line between points (204, 167) and (106, 40) then Places a yellow circle of radius 57 at center (316, 58).
; PLAN: r0=197(x), r1=234(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=167(y1), r7=106(x2), r8=40(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=58(y), r12=57(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 234
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 204
LDI r6, 167
LDI r7, 106
LDI r8, 40
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 58
LDI r12, 57
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
