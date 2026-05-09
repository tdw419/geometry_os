; DESCRIPTION: Composite: Creates a purple circular shape at (310, 107) with radius 78 then Places a blue 87x109 rectangle at position (98, 73) then Places a black dot at position (426, 139).
; PLAN: r0=310(x), r1=107(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=73(y), r7=87(width), r8=109(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x), r11=139(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 310
LDI r1, 107
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 73
LDI r7, 87
LDI r8, 109
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 139
LDI r12, 0x000000
PSET r10, r11, r12
HALT
