; DESCRIPTION: Composite: Sets a single orange pixel at (478, 82) then Places a green 62x51 rectangle at position (22, 165) then Draws a white circle centered at (149, 158) with radius 14.
; PLAN: r0=478(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=22(x), r6=165(y), r7=62(width), r8=51(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x), r11=158(y), r12=14(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 478
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 22
LDI r6, 165
LDI r7, 62
LDI r8, 51
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 158
LDI r12, 14
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
