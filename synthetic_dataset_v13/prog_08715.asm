; DESCRIPTION: Composite: Sets a single green pixel at (84, 251) then Places a orange 78x82 rectangle at position (257, 8).
; PLAN: r0=84(x), r1=251(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=8(y), r7=78(width), r8=82(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 251
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 257
LDI r6, 8
LDI r7, 78
LDI r8, 82
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
