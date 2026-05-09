; DESCRIPTION: Composite: Creates a black circular shape at (345, 83) with radius 60 then Draws a black rectangle at (156, 51) with width 75 and height 89 then Sets a single green pixel at (491, 74).
; PLAN: r0=345(x), r1=83(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=51(y), r7=75(width), r8=89(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=491(x), r11=74(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 83
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 51
LDI r7, 75
LDI r8, 89
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 74
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
