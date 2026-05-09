; DESCRIPTION: Composite: Sets a single cyan pixel at (68, 158) then Places a magenta 116x30 rectangle at position (49, 195).
; PLAN: r0=68(x), r1=158(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=195(y), r7=116(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 158
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 195
LDI r7, 116
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
