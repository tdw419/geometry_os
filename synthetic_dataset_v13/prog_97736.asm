; DESCRIPTION: Composite: Places a purple dot at position (415, 79) then Renders a green line between points (122, 45) and (324, 19) then Draws a purple circle centered at (117, 145) with radius 54.
; PLAN: r0=415(x), r1=79(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=45(y1), r7=324(x2), r8=19(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=117(x), r11=145(y), r12=54(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 415
LDI r1, 79
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 45
LDI r7, 324
LDI r8, 19
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 145
LDI r12, 54
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
