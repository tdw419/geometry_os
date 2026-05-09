; DESCRIPTION: Composite: Draws a cyan circle centered at (340, 82) with radius 53 then Draws a white rectangle at (141, 106) with width 78 and height 18 then Places a yellow dot at position (343, 35).
; PLAN: r0=340(x), r1=82(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=106(y), r7=78(width), r8=18(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=35(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 82
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 106
LDI r7, 78
LDI r8, 18
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 35
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
