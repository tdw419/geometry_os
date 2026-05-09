; DESCRIPTION: Composite: Sets a single green pixel at (257, 195) then Draws a green rectangle at (340, 98) with width 38 and height 84.
; PLAN: r0=257(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=98(y), r7=38(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 195
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 340
LDI r6, 98
LDI r7, 38
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
