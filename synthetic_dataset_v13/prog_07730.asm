; DESCRIPTION: Composite: Creates a black circular shape at (297, 155) with radius 74 then Draws a black line from (348, 43) to (247, 158) then Places a green dot at position (426, 248).
; PLAN: r0=297(x), r1=155(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=43(y1), r7=247(x2), r8=158(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=426(x), r11=248(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 297
LDI r1, 155
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 43
LDI r7, 247
LDI r8, 158
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 248
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
