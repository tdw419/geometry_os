; DESCRIPTION: Composite: Places a purple dot at position (494, 251) then Places a black line segment connecting (279, 199) to (231, 109) then Draws a yellow circle centered at (126, 134) with radius 43.
; PLAN: r0=494(x), r1=251(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=279(x1), r6=199(y1), r7=231(x2), r8=109(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=126(x), r11=134(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 494
LDI r1, 251
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 199
LDI r7, 231
LDI r8, 109
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 134
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
