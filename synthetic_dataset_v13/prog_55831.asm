; DESCRIPTION: Composite: Places a purple circle of radius 61 at center (370, 62) then Draws a white rectangle at (94, 71) with width 110 and height 102 then Places a black dot at position (26, 82).
; PLAN: r0=370(x), r1=62(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=71(y), r7=110(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=26(x), r11=82(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 62
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 71
LDI r7, 110
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 82
LDI r12, 0x000000
PSET r10, r11, r12
HALT
