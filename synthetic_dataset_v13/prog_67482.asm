; DESCRIPTION: Composite: Places a red circle of radius 23 at center (175, 172) then Places a black line segment connecting (351, 235) to (149, 56) then Places a red dot at position (504, 37).
; PLAN: r0=175(x), r1=172(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x1), r6=235(y1), r7=149(x2), r8=56(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=504(x), r11=37(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 175
LDI r1, 172
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 235
LDI r7, 149
LDI r8, 56
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 37
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
