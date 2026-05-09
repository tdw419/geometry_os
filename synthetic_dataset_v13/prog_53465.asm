; DESCRIPTION: Composite: Renders a cyan line between points (241, 117) and (442, 91) then Sets a single black pixel at (285, 241) then Places a cyan circle of radius 21 at center (261, 140).
; PLAN: r0=241(x1), r1=117(y1), r2=442(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=241(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=261(x), r11=140(y), r12=21(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 241
LDI r1, 117
LDI r2, 442
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 241
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 261
LDI r11, 140
LDI r12, 21
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
