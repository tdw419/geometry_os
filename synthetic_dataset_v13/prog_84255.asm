; DESCRIPTION: Composite: Places a white circle of radius 15 at center (370, 119) then Places a black 29x76 rectangle at position (315, 108) then Sets a single red pixel at (381, 121).
; PLAN: r0=370(x), r1=119(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x), r6=108(y), r7=29(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=381(x), r11=121(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 119
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 108
LDI r7, 29
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 121
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
