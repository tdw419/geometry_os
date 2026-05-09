; DESCRIPTION: Composite: Places a green dot at position (17, 100) then Draws a red line from (104, 204) to (123, 89) then Places a orange circle of radius 28 at center (378, 54).
; PLAN: r0=17(x), r1=100(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=104(x1), r6=204(y1), r7=123(x2), r8=89(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=54(y), r12=28(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 17
LDI r1, 100
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 104
LDI r6, 204
LDI r7, 123
LDI r8, 89
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 54
LDI r12, 28
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
