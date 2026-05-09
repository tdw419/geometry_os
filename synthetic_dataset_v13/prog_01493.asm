; DESCRIPTION: Composite: Places a magenta line segment connecting (282, 254) to (276, 50) then Creates a blue circular shape at (183, 72) with radius 13 then Places a white dot at position (225, 175).
; PLAN: r0=282(x1), r1=254(y1), r2=276(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=72(y), r7=13(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=225(x), r11=175(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 254
LDI r2, 276
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 72
LDI r7, 13
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 225
LDI r11, 175
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
