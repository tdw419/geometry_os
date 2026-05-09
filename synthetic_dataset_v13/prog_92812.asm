; DESCRIPTION: Composite: Places a white line segment connecting (501, 213) to (469, 251) then Creates a magenta circular shape at (24, 235) with radius 14 then Places a orange dot at position (495, 88).
; PLAN: r0=501(x1), r1=213(y1), r2=469(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=235(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=495(x), r11=88(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 501
LDI r1, 213
LDI r2, 469
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 235
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 495
LDI r11, 88
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
