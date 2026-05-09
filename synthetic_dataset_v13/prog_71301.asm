; DESCRIPTION: Composite: Renders a green line between points (465, 20) and (139, 237) then Sets a single yellow pixel at (391, 19) then Places a orange circle of radius 16 at center (189, 55).
; PLAN: r0=465(x1), r1=20(y1), r2=139(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=19(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=189(x), r11=55(y), r12=16(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 465
LDI r1, 20
LDI r2, 139
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 19
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 189
LDI r11, 55
LDI r12, 16
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
