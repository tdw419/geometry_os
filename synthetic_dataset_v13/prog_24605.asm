; DESCRIPTION: Composite: Places a purple dot at position (97, 40) then Places a purple 26x79 rectangle at position (430, 40) then Places a green circle of radius 58 at center (257, 139).
; PLAN: r0=97(x), r1=40(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=430(x), r6=40(y), r7=26(width), r8=79(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x), r11=139(y), r12=58(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 40
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 430
LDI r6, 40
LDI r7, 26
LDI r8, 79
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 139
LDI r12, 58
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
