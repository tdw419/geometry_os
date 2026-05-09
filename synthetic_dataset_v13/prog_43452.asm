; DESCRIPTION: Composite: Places a white circle of radius 57 at center (438, 91) then Sets a single black pixel at (153, 75) then Draws a purple rectangle at (172, 118) with width 44 and height 78.
; PLAN: r0=438(x), r1=91(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=75(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=172(x), r11=118(y), r12=44(width), r13=78(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 91
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 75
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 172
LDI r11, 118
LDI r12, 44
LDI r13, 78
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
