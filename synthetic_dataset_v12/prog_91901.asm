; DESCRIPTION: Composite: Renders a black disk with center (452, 151) and radius 33 then Renders a green line between points (463, 172) and (325, 252) then Sets a single red pixel at (91, 230).
; PLAN: r0=452(x), r1=151(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x1), r6=172(y1), r7=325(x2), r8=252(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=91(x), r11=230(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 452
LDI r1, 151
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 172
LDI r7, 325
LDI r8, 252
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 230
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
