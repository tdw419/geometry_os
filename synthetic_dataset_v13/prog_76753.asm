; DESCRIPTION: Composite: Sets a single orange pixel at (456, 203) then Places a cyan 53x114 rectangle at position (452, 83).
; PLAN: r0=456(x), r1=203(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=452(x), r6=83(y), r7=53(width), r8=114(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 203
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 452
LDI r6, 83
LDI r7, 53
LDI r8, 114
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
