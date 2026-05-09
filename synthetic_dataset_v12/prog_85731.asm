; DESCRIPTION: Composite: Draws a green circle centered at (108, 110) with radius 71 then Places a red line segment connecting (414, 60) to (39, 106) then Places a purple dot at position (296, 89).
; PLAN: r0=108(x), r1=110(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x1), r6=60(y1), r7=39(x2), r8=106(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=89(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 110
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 60
LDI r7, 39
LDI r8, 106
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 89
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
