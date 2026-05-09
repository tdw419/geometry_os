; DESCRIPTION: Composite: Places a black circle of radius 45 at center (314, 62) then Draws a blue line from (226, 82) to (205, 3) then Places a purple dot at position (47, 149).
; PLAN: r0=314(x), r1=62(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x1), r6=82(y1), r7=205(x2), r8=3(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=149(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 314
LDI r1, 62
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 82
LDI r7, 205
LDI r8, 3
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 149
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
