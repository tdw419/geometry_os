; DESCRIPTION: Composite: Places a white dot at position (112, 134) then Places a purple line segment connecting (440, 172) to (478, 118) then Creates a orange circular shape at (143, 197) with radius 59.
; PLAN: r0=112(x), r1=134(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=440(x1), r6=172(y1), r7=478(x2), r8=118(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=143(x), r11=197(y), r12=59(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 134
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 440
LDI r6, 172
LDI r7, 478
LDI r8, 118
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 197
LDI r12, 59
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
