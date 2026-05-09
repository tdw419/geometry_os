; DESCRIPTION: Composite: Renders a yellow line between points (318, 241) and (57, 6) then Places a black circle of radius 53 at center (410, 105) then Sets a single black pixel at (42, 53).
; PLAN: r0=318(x1), r1=241(y1), r2=57(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=105(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=42(x), r11=53(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 318
LDI r1, 241
LDI r2, 57
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 105
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 42
LDI r11, 53
LDI r12, 0x000000
PSET r10, r11, r12
HALT
