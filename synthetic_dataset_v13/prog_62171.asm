; DESCRIPTION: Composite: Draws a orange circle centered at (238, 76) with radius 68 then Renders a purple line between points (332, 11) and (511, 244) then Sets a single purple pixel at (255, 131).
; PLAN: r0=238(x), r1=76(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=11(y1), r7=511(x2), r8=244(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=131(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 238
LDI r1, 76
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 11
LDI r7, 511
LDI r8, 244
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 131
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
