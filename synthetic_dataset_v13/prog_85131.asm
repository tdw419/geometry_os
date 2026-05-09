; DESCRIPTION: Composite: Sets a single purple pixel at (501, 147) then Draws a orange line from (384, 196) to (364, 51) then Creates a green circular shape at (134, 143) with radius 60.
; PLAN: r0=501(x), r1=147(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=384(x1), r6=196(y1), r7=364(x2), r8=51(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=134(x), r11=143(y), r12=60(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 501
LDI r1, 147
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 384
LDI r6, 196
LDI r7, 364
LDI r8, 51
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 143
LDI r12, 60
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
