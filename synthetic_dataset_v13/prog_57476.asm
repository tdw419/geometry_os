; DESCRIPTION: Composite: Places a orange dot at position (498, 119) then Draws a cyan rectangle at (318, 148) with width 32 and height 95.
; PLAN: r0=498(x), r1=119(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=148(y), r7=32(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 498
LDI r1, 119
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 318
LDI r6, 148
LDI r7, 32
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
