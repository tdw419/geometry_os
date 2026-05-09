; DESCRIPTION: Composite: Draws a blue circle centered at (139, 84) with radius 70 then Draws a green line from (138, 35) to (244, 167) then Sets a single blue pixel at (155, 119).
; PLAN: r0=139(x), r1=84(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x1), r6=35(y1), r7=244(x2), r8=167(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=119(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 84
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 35
LDI r7, 244
LDI r8, 167
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 119
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
