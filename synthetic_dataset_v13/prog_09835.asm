; DESCRIPTION: Composite: Places a black 94x49 rectangle at position (119, 126) then Sets a single green pixel at (62, 6) then Places a orange circle of radius 64 at center (187, 103).
; PLAN: r0=119(x), r1=126(y), r2=94(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=6(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=187(x), r11=103(y), r12=64(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 126
LDI r2, 94
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 6
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 187
LDI r11, 103
LDI r12, 64
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
