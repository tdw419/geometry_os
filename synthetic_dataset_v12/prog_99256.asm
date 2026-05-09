; DESCRIPTION: Composite: Creates a black circular shape at (179, 108) with radius 46 then Renders a orange line between points (82, 22) and (457, 251) then Sets a single black pixel at (20, 255).
; PLAN: r0=179(x), r1=108(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x1), r6=22(y1), r7=457(x2), r8=251(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=20(x), r11=255(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 179
LDI r1, 108
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 22
LDI r7, 457
LDI r8, 251
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 255
LDI r12, 0x000000
PSET r10, r11, r12
HALT
