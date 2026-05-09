; DESCRIPTION: Composite: Places a black 51x59 rectangle at position (426, 147) then Places a black line segment connecting (478, 23) to (131, 158) then Places a orange dot at position (72, 151).
; PLAN: r0=426(x), r1=147(y), r2=51(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x1), r6=23(y1), r7=131(x2), r8=158(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=72(x), r11=151(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 147
LDI r2, 51
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 23
LDI r7, 131
LDI r8, 158
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 151
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
