; DESCRIPTION: Composite: Sets a single black pixel at (241, 102) then Places a blue 49x75 rectangle at position (438, 42).
; PLAN: r0=241(x), r1=102(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=42(y), r7=49(width), r8=75(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 102
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 438
LDI r6, 42
LDI r7, 49
LDI r8, 75
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
