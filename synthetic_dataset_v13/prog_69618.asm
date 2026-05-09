; DESCRIPTION: Composite: Renders a red line between points (456, 185) and (151, 220) then Sets a single purple pixel at (252, 27) then Draws a red circle centered at (351, 65) with radius 10.
; PLAN: r0=456(x1), r1=185(y1), r2=151(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=27(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=351(x), r11=65(y), r12=10(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 456
LDI r1, 185
LDI r2, 151
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 27
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 351
LDI r11, 65
LDI r12, 10
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
