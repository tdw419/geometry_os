; DESCRIPTION: Composite: Renders a purple line between points (87, 49) and (157, 2) then Creates a green circular shape at (113, 179) with radius 54 then Sets a single red pixel at (208, 156).
; PLAN: r0=87(x1), r1=49(y1), r2=157(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=179(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=208(x), r11=156(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 49
LDI r2, 157
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 179
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 208
LDI r11, 156
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
