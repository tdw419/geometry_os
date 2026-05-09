; DESCRIPTION: Composite: Draws a purple circle centered at (439, 98) with radius 58 then Renders a purple line between points (449, 135) and (503, 134) then Sets a single red pixel at (189, 176).
; PLAN: r0=439(x), r1=98(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x1), r6=135(y1), r7=503(x2), r8=134(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=176(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 98
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 135
LDI r7, 503
LDI r8, 134
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 176
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
