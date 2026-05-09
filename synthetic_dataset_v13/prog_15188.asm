; DESCRIPTION: Composite: Places a purple dot at position (494, 133) then Draws a white line from (19, 125) to (52, 104) then Draws a yellow circle centered at (322, 85) with radius 55.
; PLAN: r0=494(x), r1=133(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=19(x1), r6=125(y1), r7=52(x2), r8=104(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=322(x), r11=85(y), r12=55(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 494
LDI r1, 133
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 125
LDI r7, 52
LDI r8, 104
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 85
LDI r12, 55
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
