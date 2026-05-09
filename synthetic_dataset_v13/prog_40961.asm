; DESCRIPTION: Composite: Places a green circle of radius 15 at center (354, 115) then Places a purple dot at position (484, 54) then Draws a cyan rectangle at (351, 3) with width 118 and height 73.
; PLAN: r0=354(x), r1=115(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x), r6=54(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=351(x), r11=3(y), r12=118(width), r13=73(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 115
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 54
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 351
LDI r11, 3
LDI r12, 118
LDI r13, 73
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
