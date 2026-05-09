; DESCRIPTION: Composite: Draws a white circle centered at (384, 101) with radius 56 then Places a orange line segment connecting (227, 251) to (410, 172) then Sets a single purple pixel at (208, 179).
; PLAN: r0=384(x), r1=101(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x1), r6=251(y1), r7=410(x2), r8=172(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=208(x), r11=179(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 101
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 251
LDI r7, 410
LDI r8, 172
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 179
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
