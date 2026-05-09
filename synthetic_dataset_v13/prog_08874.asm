; DESCRIPTION: Composite: Draws a white rectangle at (221, 89) with width 47 and height 90 then Places a orange dot at position (118, 94) then Draws a purple circle centered at (318, 195) with radius 18.
; PLAN: r0=221(x), r1=89(y), r2=47(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=94(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=318(x), r11=195(y), r12=18(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 89
LDI r2, 47
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 94
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 318
LDI r11, 195
LDI r12, 18
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
