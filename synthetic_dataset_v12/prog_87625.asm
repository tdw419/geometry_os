; DESCRIPTION: Composite: Renders a white line between points (259, 19) and (89, 138) then Sets a single purple pixel at (205, 230) then Creates a cyan circular shape at (166, 44) with radius 18.
; PLAN: r0=259(x1), r1=19(y1), r2=89(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=230(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=166(x), r11=44(y), r12=18(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 19
LDI r2, 89
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 230
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 166
LDI r11, 44
LDI r12, 18
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
