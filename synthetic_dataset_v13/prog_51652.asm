; DESCRIPTION: Composite: Draws a white rectangle at (378, 161) with width 74 and height 81 then Places a yellow line segment connecting (399, 227) to (478, 117) then Sets a single red pixel at (332, 19).
; PLAN: r0=378(x), r1=161(y), r2=74(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x1), r6=227(y1), r7=478(x2), r8=117(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=332(x), r11=19(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 161
LDI r2, 74
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 227
LDI r7, 478
LDI r8, 117
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 19
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
