; DESCRIPTION: Composite: Creates a orange circular shape at (95, 100) with radius 75 then Draws a purple rectangle at (15, 134) with width 80 and height 58 then Places a black dot at position (199, 64).
; PLAN: r0=95(x), r1=100(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=134(y), r7=80(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x), r11=64(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 100
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 134
LDI r7, 80
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 64
LDI r12, 0x000000
PSET r10, r11, r12
HALT
