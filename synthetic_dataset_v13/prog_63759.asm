; DESCRIPTION: Composite: Places a yellow 118x105 rectangle at position (347, 32) then Places a orange dot at position (498, 95) then Creates a blue circular shape at (163, 115) with radius 70.
; PLAN: r0=347(x), r1=32(y), r2=118(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=498(x), r6=95(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=163(x), r11=115(y), r12=70(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 32
LDI r2, 118
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 95
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 163
LDI r11, 115
LDI r12, 70
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
