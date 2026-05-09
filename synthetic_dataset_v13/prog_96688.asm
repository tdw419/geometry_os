; DESCRIPTION: Composite: Draws a yellow line from (435, 89) to (26, 105) then Draws a white circle centered at (430, 172) with radius 40 then Places a white dot at position (369, 73).
; PLAN: r0=435(x1), r1=89(y1), r2=26(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=172(y), r7=40(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x), r11=73(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 435
LDI r1, 89
LDI r2, 26
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 172
LDI r7, 40
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 73
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
