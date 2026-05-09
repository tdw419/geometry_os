; DESCRIPTION: Composite: Places a orange 104x75 rectangle at position (195, 49) then Sets a single cyan pixel at (288, 143) then Draws a cyan circle centered at (349, 115) with radius 36.
; PLAN: r0=195(x), r1=49(y), r2=104(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x), r6=143(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=349(x), r11=115(y), r12=36(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 195
LDI r1, 49
LDI r2, 104
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 143
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 349
LDI r11, 115
LDI r12, 36
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
