; DESCRIPTION: Composite: Places a black 55x93 rectangle at position (164, 72) then Creates a orange circular shape at (321, 149) with radius 49 then Sets a single green pixel at (155, 236).
; PLAN: r0=164(x), r1=72(y), r2=55(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=149(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=236(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 72
LDI r2, 55
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 149
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 236
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
