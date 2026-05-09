; DESCRIPTION: Composite: Renders a green line between points (291, 167) and (160, 9) then Renders a black box of size 44x97 starting at (378, 73) then Sets a single blue pixel at (155, 3).
; PLAN: r0=291(x1), r1=167(y1), r2=160(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=73(y), r7=44(width), r8=97(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=3(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 291
LDI r1, 167
LDI r2, 160
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 73
LDI r7, 44
LDI r8, 97
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 3
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
