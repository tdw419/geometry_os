; DESCRIPTION: Composite: Places a white 48x94 rectangle at position (343, 19) then Draws a cyan circle centered at (153, 115) with radius 26 then Sets a single cyan pixel at (379, 23).
; PLAN: r0=343(x), r1=19(y), r2=48(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=115(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=379(x), r11=23(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 19
LDI r2, 48
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 115
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 379
LDI r11, 23
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
