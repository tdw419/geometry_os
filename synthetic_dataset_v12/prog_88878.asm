; DESCRIPTION: Composite: Creates a orange circular shape at (232, 175) with radius 58 then Places a black 18x94 rectangle at position (292, 126) then Sets a single green pixel at (405, 8).
; PLAN: r0=232(x), r1=175(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=126(y), r7=18(width), r8=94(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x), r11=8(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 175
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 126
LDI r7, 18
LDI r8, 94
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 8
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
