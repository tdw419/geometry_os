; DESCRIPTION: Composite: Places a cyan circle of radius 35 at center (309, 79) then Renders a green line between points (8, 82) and (112, 15) then Sets a single blue pixel at (261, 23).
; PLAN: r0=309(x), r1=79(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x1), r6=82(y1), r7=112(x2), r8=15(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=23(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 309
LDI r1, 79
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 82
LDI r7, 112
LDI r8, 15
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 23
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
