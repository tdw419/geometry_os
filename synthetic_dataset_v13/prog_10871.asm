; DESCRIPTION: Composite: Renders a black line between points (497, 184) and (413, 105) then Sets a single magenta pixel at (427, 134) then Renders a blue box of size 31x88 starting at (470, 82).
; PLAN: r0=497(x1), r1=184(y1), r2=413(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=134(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=470(x), r11=82(y), r12=31(width), r13=88(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 184
LDI r2, 413
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 134
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 470
LDI r11, 82
LDI r12, 31
LDI r13, 88
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
