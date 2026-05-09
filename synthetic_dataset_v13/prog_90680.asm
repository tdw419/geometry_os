; DESCRIPTION: Composite: Sets a single blue pixel at (25, 74) then Renders a orange line between points (8, 101) and (371, 185) then Renders a white disk with center (98, 134) and radius 31.
; PLAN: r0=25(x), r1=74(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=101(y1), r7=371(x2), r8=185(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=134(y), r12=31(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 74
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 8
LDI r6, 101
LDI r7, 371
LDI r8, 185
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 134
LDI r12, 31
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
