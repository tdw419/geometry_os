; DESCRIPTION: Composite: Sets a single black pixel at (490, 132) then Renders a orange line between points (206, 124) and (374, 131) then Renders a green disk with center (256, 121) and radius 62.
; PLAN: r0=490(x), r1=132(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=206(x1), r6=124(y1), r7=374(x2), r8=131(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=121(y), r12=62(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 490
LDI r1, 132
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 206
LDI r6, 124
LDI r7, 374
LDI r8, 131
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 121
LDI r12, 62
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
