; DESCRIPTION: Composite: Draws a cyan circle centered at (65, 147) with radius 18 then Places a purple 83x42 rectangle at position (157, 119) then Places a white dot at position (390, 119).
; PLAN: r0=65(x), r1=147(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=119(y), r7=83(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x), r11=119(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 147
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 119
LDI r7, 83
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 119
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
