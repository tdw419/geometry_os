; DESCRIPTION: Composite: Sets a single yellow pixel at (396, 134) then Renders a white line between points (31, 84) and (201, 218) then Draws a cyan circle centered at (53, 53) with radius 25.
; PLAN: r0=396(x), r1=134(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=31(x1), r6=84(y1), r7=201(x2), r8=218(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=53(x), r11=53(y), r12=25(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 134
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 31
LDI r6, 84
LDI r7, 201
LDI r8, 218
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 53
LDI r12, 25
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
