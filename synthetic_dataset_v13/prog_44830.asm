; DESCRIPTION: Composite: Sets a single blue pixel at (71, 115) then Places a black 76x106 rectangle at position (8, 122).
; PLAN: r0=71(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=8(x), r6=122(y), r7=76(width), r8=106(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 8
LDI r6, 122
LDI r7, 76
LDI r8, 106
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
