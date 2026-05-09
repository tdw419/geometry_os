; DESCRIPTION: Composite: Places a purple circle of radius 49 at center (167, 78) then Renders a blue line between points (348, 222) and (319, 202) then Sets a single green pixel at (140, 133).
; PLAN: r0=167(x), r1=78(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=222(y1), r7=319(x2), r8=202(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=140(x), r11=133(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 78
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 222
LDI r7, 319
LDI r8, 202
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 133
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
