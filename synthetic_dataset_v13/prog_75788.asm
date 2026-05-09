; DESCRIPTION: Composite: Places a orange circle of radius 33 at center (46, 136) then Draws a orange line from (201, 48) to (309, 148) then Places a orange dot at position (302, 190).
; PLAN: r0=46(x), r1=136(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x1), r6=48(y1), r7=309(x2), r8=148(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=190(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 46
LDI r1, 136
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 48
LDI r7, 309
LDI r8, 148
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 190
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
