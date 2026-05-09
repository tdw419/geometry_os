; DESCRIPTION: Composite: Draws a black line from (119, 176) to (51, 115) then Renders a blue box of size 11x71 starting at (378, 184) then Sets a single red pixel at (340, 224).
; PLAN: r0=119(x1), r1=176(y1), r2=51(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=184(y), r7=11(width), r8=71(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x), r11=224(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 176
LDI r2, 51
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 184
LDI r7, 11
LDI r8, 71
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 224
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
