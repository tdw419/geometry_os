; DESCRIPTION: Composite: Draws a blue line from (155, 255) to (112, 36) then Draws a black circle centered at (430, 87) with radius 11 then Places a purple dot at position (80, 153).
; PLAN: r0=155(x1), r1=255(y1), r2=112(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=87(y), r7=11(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=80(x), r11=153(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 255
LDI r2, 112
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 87
LDI r7, 11
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 80
LDI r11, 153
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
