; DESCRIPTION: Composite: Renders a orange line between points (24, 68) and (369, 114) then Places a cyan circle of radius 17 at center (97, 236) then Sets a single yellow pixel at (367, 95).
; PLAN: r0=24(x1), r1=68(y1), r2=369(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=236(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x), r11=95(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 24
LDI r1, 68
LDI r2, 369
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 236
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 95
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
