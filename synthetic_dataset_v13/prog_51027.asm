; DESCRIPTION: Composite: Sets a single orange pixel at (139, 176) then Places a green 15x106 rectangle at position (365, 30).
; PLAN: r0=139(x), r1=176(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=30(y), r7=15(width), r8=106(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 176
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 365
LDI r6, 30
LDI r7, 15
LDI r8, 106
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
